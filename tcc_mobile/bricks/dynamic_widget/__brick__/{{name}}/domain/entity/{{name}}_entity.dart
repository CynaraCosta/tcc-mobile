import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}Entity extends Equatable {
  const {{name.pascalCase()}}Entity({
    required this.field,
  });

  factory {{name.pascalCase()}}Entity.fromJson(dynamic json) {
    return {{name.pascalCase()}}Entity(
      field: json['field'] ?? '',
    );
  }

  final String field;

  @override
  List<Object?> get props => [field];
}