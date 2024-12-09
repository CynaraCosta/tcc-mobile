import 'package:flutter/widgets.dart';

class {{name.pascalCase()}}ErrorWidget extends StatelessWidget {
  const {{name.pascalCase()}}ErrorWidget({
    this.onTapError,
    super.key,
  });

  final void Function()? onTapError;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}