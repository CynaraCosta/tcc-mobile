import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';

class WidgetModel extends Equatable {
  const WidgetModel({
    this.id = '',
    this.state = WidgetState.loading,
    this.path,
    this.data,
    this.style,
  });

  factory WidgetModel.fromMap(Map<String, dynamic> map) {
    return WidgetModel(
      id: map['id'] ?? '',
      state: WidgetState.getByName(map['state']),
      path: map['path'],
      data: map['data'],
      style: map['style'] == null ? null : WidgetStyle.fromMap(map['style']),
    );
  }

  WidgetModel copyWith({
    String? id,
    WidgetState? state,
    String? path,
    dynamic data,
    WidgetStyle? style,
  }) {
    return WidgetModel(
      id: id ?? this.id,
      state: state ?? this.state,
      path: path ?? this.path,
      data: data ?? this.data,
      style: style ?? this.style,
    );
  }

  final String id;
  final WidgetState state;
  final String? path;
  final dynamic data;
  final WidgetStyle? style;

  @override
  List<Object?> get props => [
        id,
        state,
        path,
        data,
        style,
      ];
}
