import 'package:flutter/widgets.dart';

typedef ModelBuilder<M, P> = Future<M> Function(P provider);

typedef SuccessBuilder<M> = Widget Function(BuildContext context, M model);

typedef LoadingBuilder<M> = Widget Function(BuildContext context);

typedef ErrorBuilder<M> = Widget Function(
  BuildContext context,
  Object? error,
  StackTrace? stackTrace,
);

class OnRetryAction extends ValueNotifier<bool> {
  OnRetryAction() : super(false);

  void call() {
    value = true;
  }

  void reset() {
    value = false;
  }
}

abstract class DynamicWidgetBuilderBase<M, P> extends StatefulWidget {
  const DynamicWidgetBuilderBase({
    required this.provider,
    required this.successBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.onRetryAction,
    super.key,
  });

  final P provider;
  final SuccessBuilder<M> successBuilder;
  final LoadingBuilder? loadingBuilder;
  final ErrorBuilder? errorBuilder;
  final OnRetryAction? onRetryAction;
}
