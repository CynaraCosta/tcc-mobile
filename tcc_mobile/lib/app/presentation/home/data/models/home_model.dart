import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/app/presentation/home/domain/entities/home_entity.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class HomeModel extends Equatable {
  const HomeModel({
    required this.widgets,
  });

  factory HomeModel.fromJson(dynamic json) {
    final List<dynamic> widgetsList = json['widgets'];
    final List<WidgetModel> widgets = widgetsList
        .map((dynamic widgetJson) => WidgetModel.fromMap(widgetJson))
        .toList();
    return HomeModel(widgets: widgets);
  }

  HomeEntity toEntity() {
    return HomeEntity(
      widgets: widgets.map((widget) => widget).toList(),
    );
  }

  final List<WidgetModel> widgets;

  @override
  List<Object?> get props => [widgets];
}
