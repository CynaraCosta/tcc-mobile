import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/domain/boundary/command/widget_content_command.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'domain/entity/{{name}}_entity.dart';
import 'widgets/{{name}}_error_widget.dart';
import 'widgets/{{name}}_loading_widget.dart';
import 'widgets/{{name}}_success_widget.dart';

class {{name.pascalCase()}}Widget extends StatelessWidget {
  const {{name.pascalCase()}}Widget({
    required this.model,
    required this.provider,
    super.key,
  });

  final WidgetModel model;
  final WidgetContentCommand<{{name.pascalCase()}}Entity> provider;

  @override
  Widget build(BuildContext context) {
    final onRetryAction = OnRetryAction();
    return DynamicFutureWidgetBuilder<{{name.pascalCase()}}Entity, WidgetContentCommand<{{name.pascalCase()}}Entity>>(
      provider: provider, 
      modelBuilder: (provider) => provider.execute(
        WidgetGetContentEvent(content: model),
      ), 
      successBuilder: (buildContenxt, entity) => {{name.pascalCase()}}SuccessWidget(entity: entity),
      errorBuilder: (buildContenxt, error, stackTrace) => {{name.pascalCase()}}ErrorWidget(
        onTapError: onRetryAction.call,
      ),
      loadingBuilder: (buildContenxt) => const {{name.pascalCase()}}LoadingWidget(),
      onRetryAction: onRetryAction,
    );
  }
}