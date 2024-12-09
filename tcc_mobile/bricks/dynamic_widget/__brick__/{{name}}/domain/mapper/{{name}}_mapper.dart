import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import '../entity/{{name}}_entity.dart';

class {{name.pascalCase()}}Mapper extends WidgetContentMapper<{{name.pascalCase()}}Entity> {
  @override
  {{name.pascalCase()}}Entity mapToContent(dynamic model) {
    return {{name.pascalCase()}}Entity.fromJson(model);
  }
}