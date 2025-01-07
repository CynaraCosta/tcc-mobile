import 'package:flutter/material.dart';

class SkeletonEffectScope extends StatefulWidget {
  const SkeletonEffectScope({
    required this.linearGradient,
    required this.duration,
    required this.child,
    super.key,
  });

  final LinearGradient linearGradient;
  final Duration duration;
  final Widget child;

  static SkeletonEffectScopeState? of(BuildContext context) {
    return context.findAncestorStateOfType<SkeletonEffectScopeState>();
  }

  @override
  State<StatefulWidget> createState() => SkeletonEffectScopeState();
}

class SkeletonEffectScopeState extends State<SkeletonEffectScope>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: widget.duration);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  LinearGradient get gradient => LinearGradient(
        colors: widget.linearGradient.colors,
        stops: widget.linearGradient.stops,
        begin: widget.linearGradient.begin,
        end: widget.linearGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _animationController.value),
      );

  RenderObject? get renderBox {
    return context.findRenderObject();
  }

  bool get hasRenderBox => renderBox != null;

  bool get isSized {
    if (hasRenderBox) {
      return (renderBox as RenderBox).hasSize;
    }
    return false;
  }

  Size get size => (renderBox as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = renderBox as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  Listenable get scopeAnimationController => _animationController;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}

class SkeletonEffect extends StatefulWidget {
  const SkeletonEffect({
    required this.loading,
    required this.child,
    super.key,
  });

  final bool loading;
  final Widget child;

  @override
  State<SkeletonEffect> createState() => _SkeletonEffectState();
}

class _SkeletonEffectState extends State<SkeletonEffect> {
  Listenable? _scopeAnimationController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final scope = SkeletonEffectScope.of(context);

    if (_scopeAnimationController != null) {
      _scopeAnimationController!.removeListener(_onAnimationNotifiesChange);
    }

    _scopeAnimationController = scope?.scopeAnimationController;
    if (_scopeAnimationController != null) {
      _scopeAnimationController!.addListener(_onAnimationNotifiesChange);
    }
  }

  @override
  void dispose() {
    _scopeAnimationController?.removeListener(_onAnimationNotifiesChange);
    super.dispose();
  }

  void _onAnimationNotifiesChange() {
    if (widget.loading) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.loading) {
      return widget.child;
    }

    final shimmer = SkeletonEffectScope.of(context);
    if (!(shimmer?.isSized == true)) {
      return _SkeletonEffectVisibility(child: widget.child);
    }

    if (context.findRenderObject() == null) {
      return _SkeletonEffectVisibility(child: widget.child);
    }

    final shimmerSize = shimmer!.size;
    final gradient = shimmer.gradient;
    final offsetWithinShimmer = shimmer.getDescendantOffset(
      descendant: context.findRenderObject() as RenderBox,
    );

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -offsetWithinShimmer.dx,
            -offsetWithinShimmer.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

class _SkeletonEffectVisibility extends StatelessWidget {
  const _SkeletonEffectVisibility({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      maintainSize: true,
      maintainState: true,
      maintainAnimation: true,
      maintainInteractivity: false,
      maintainSemantics: false,
      child: child,
    );
  }
}
