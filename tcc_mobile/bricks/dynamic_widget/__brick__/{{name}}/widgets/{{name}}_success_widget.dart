import 'package:flutter/widgets.dart';
import '../domain/entity/{{name}}_entity.dart';

class {{name.pascalCase()}}SuccessWidget extends StatelessWidget {
  const {{name.pascalCase()}}SuccessWidget({
    required this.entity,
    super.key,
  });

  final {{name.pascalCase()}}Entity entity;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}