import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import '../domain/entity/{{name}}_entity.dart';
import '../domain/mapper/{{name}}_mapper.dart';
import '../{{name}}_widget.dart';

class {{name.pascalCase()}}Module extends DynamicWidgetBuilderBaseModule<{{name.pascalCase()}}Entity, {{name.pascalCase()}}Widget> {
  @override
  FutureOr<void> init(GetItHelper gh) {
    gh.factory<WidgetContentMapper<{{name.pascalCase()}}Entity>>(() => {{name.pascalCase()}}Mapper());
    return super.init(gh);
  }
}