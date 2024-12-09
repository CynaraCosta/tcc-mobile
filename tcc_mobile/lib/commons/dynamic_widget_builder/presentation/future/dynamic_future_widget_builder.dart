import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class DynamicFutureWidgetBuilderBase<M, P>
    extends DynamicWidgetBuilderBase<M, P> {
  const DynamicFutureWidgetBuilderBase({
    required super.provider,
    required this.modelBuilder,
    required super.successBuilder,
    super.loadingBuilder,
    super.errorBuilder,
    super.onRetryAction,
    super.key,
  });

  final ModelBuilder<M, P> modelBuilder;
  @override
  State<DynamicFutureWidgetBuilderBase<M, P>> createState() =>
      _DynamicFutureWidgetBuilderBaseState<M, P>();
}

class _DynamicFutureWidgetBuilderBaseState<M, P>
    extends State<DynamicFutureWidgetBuilderBase<M, P>> {
  late P _provider;

  @override
  void initState() {
    super.initState();
    _provider = widget.provider;
    widget.onRetryAction?.addListener(_listenOnTapError);
  }

  @override
  void dispose() {
    widget.onRetryAction?.removeListener(_listenOnTapError);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.modelBuilder(_provider),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.loadingBuilder?.call(context) ??
              const SizedBox.shrink();
        } else if (snapshot.hasError) {
          return widget.errorBuilder
                  ?.call(context, snapshot.error, snapshot.stackTrace) ??
              const SizedBox.shrink();
        } else {
          return widget.successBuilder(context, snapshot.data as M);
        }
      },
    );
  }

  void _listenOnTapError() {
    setState(() {
      _provider = widget.provider;
      widget.onRetryAction?.reset();
    });
  }
}

class DynamicFutureWidgetBuilder<M, P>
    extends DynamicFutureWidgetBuilderBase<M, P> {
  const DynamicFutureWidgetBuilder({
    required super.provider,
    required super.modelBuilder,
    required super.successBuilder,
    super.loadingBuilder,
    super.errorBuilder,
    super.onRetryAction,
    super.key,
  });
}
