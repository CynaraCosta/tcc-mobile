import 'package:mason/mason.dart';

void run(HookContext context) {
  context.vars = {
    ...context.vars,
    'name': (context.vars['name'] as String).snakeCase,
  };
}
