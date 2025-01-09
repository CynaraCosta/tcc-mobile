import 'package:equatable/equatable.dart';

final class WidgetStyle extends Equatable {
  const WidgetStyle({
    this.bounds,
  });

  factory WidgetStyle.fromMap(Map<String, dynamic> map) {
    return WidgetStyle(
      bounds: WidgetBounds.fromMap(map['bounds']),
    );
  }

  final WidgetBounds? bounds;

  @override
  List<Object?> get props => [
        bounds,
      ];
}

final class WidgetBounds extends Equatable {
  const WidgetBounds({
    this.bottom,
    this.top,
    this.left,
    this.right,
  });

  factory WidgetBounds.fromMap(Map<String, dynamic> map) {
    return WidgetBounds(
      bottom: map['bottom'],
      top: map['top'],
      left: map['left'],
      right: map['right'],
    );
  }

  final String? bottom;
  final String? top;
  final String? left;
  final String? right;

  @override
  List<Object?> get props => [
        bottom,
        top,
        left,
        right,
      ];
}
