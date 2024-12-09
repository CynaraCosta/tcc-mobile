import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

abstract class WidgetEvent extends Equatable {
  const WidgetEvent();
}

class WidgetGetContentEvent extends WidgetEvent {
  const WidgetGetContentEvent({
    required this.content,
  });

  final WidgetModel content;

  @override
  List<Object?> get props => [];
}
