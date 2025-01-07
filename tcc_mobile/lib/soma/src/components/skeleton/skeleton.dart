import 'package:flutter/material.dart';
import 'package:tcc_mobile/soma/soma.dart';

class SkeletonScope extends StatelessWidget {
  const SkeletonScope({
    required this.runAnimation,
    required this.child,
    super.key,
  });

  final Widget child;
  final bool runAnimation;

  @override
  Widget build(BuildContext context) {
    final style = SomaTheme.getComponentTokensOf(context).skeleton;
    return runAnimation
        ? SkeletonEffectScope(
            linearGradient: style.gradient,
            duration: style.duration,
            child: child,
          )
        : child;
  }
}

class SkeletonState {
  SkeletonState(this.skeleton);

  final Widget Function() skeleton;
}

class BoxSkeleton extends StatelessWidget {
  const BoxSkeleton({
    required this.height,
    this.width,
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  factory BoxSkeleton.circular(double size) {
    return BoxSkeleton(
      height: size,
      width: size,
      borderRadius: BorderRadius.circular(size / 2),
    );
  }

  factory BoxSkeleton.size(double size) {
    return BoxSkeleton(
      height: size,
      width: size,
      borderRadius: BorderRadius.zero,
    );
  }

  final double height;
  final double? width;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return SkeletonEffect(
      loading: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: Colors.black,
        ),
        height: height,
        width: width,
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  const CircleSkeleton({
    required this.size,
    super.key,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return BoxSkeleton(
      height: size,
      width: size,
      borderRadius: BorderRadius.circular(100),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    required this.child,
    required this.showSkeleton,
    super.key,
  });

  final Widget child;
  final bool showSkeleton;

  @override
  Widget build(BuildContext context) {
    if (showSkeleton) {
      return AbsorbPointer(
        absorbing: showSkeleton,
        child: SkeletonEffect(
          loading: showSkeleton,
          child: child,
        ),
      );
    }
    return child;
  }
}

class SkeletonVisibility extends StatelessWidget {
  const SkeletonVisibility({
    required this.child,
    required this.hidden,
    required this.maintainSize,
    super.key,
  });

  final Widget child;
  final bool hidden;
  final bool maintainSize;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !hidden,
      maintainAnimation: maintainSize,
      maintainInteractivity: false,
      maintainSemantics: false,
      maintainState: maintainSize,
      maintainSize: maintainSize,
      child: child,
    );
  }
}
