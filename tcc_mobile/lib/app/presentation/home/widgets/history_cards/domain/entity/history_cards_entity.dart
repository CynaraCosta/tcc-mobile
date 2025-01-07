import 'package:equatable/equatable.dart';

class HistoryCardsEntity extends Equatable {
  const HistoryCardsEntity({
    required this.field,
  });

  factory HistoryCardsEntity.fromJson(dynamic json) {
    return HistoryCardsEntity(
      field: json['field'] ?? '',
    );
  }

  final String field;

  @override
  List<Object?> get props => [field];
}