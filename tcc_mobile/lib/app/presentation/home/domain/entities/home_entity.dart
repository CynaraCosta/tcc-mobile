import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class HomeEntity extends Equatable {
  const HomeEntity({
    required this.widgets,
  });

  final List<WidgetModel> widgets;

  @override
  List<Object?> get props => [widgets];
}
