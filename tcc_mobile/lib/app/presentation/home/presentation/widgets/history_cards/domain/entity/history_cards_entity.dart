import 'package:equatable/equatable.dart';

class HistoryCardsEntity extends Equatable {
  const HistoryCardsEntity({
    required this.title,
    required this.cards,
    this.subtitle,
  });

  factory HistoryCardsEntity.fromJson(dynamic json) {
    return HistoryCardsEntity(
      title: json['title'],
      subtitle: json['subtitle'],
      cards: (json['cards'] as List)
          .map((card) => CardHistoryCardsEntity.fromJson(card))
          .toList(),
    );
  }

  final String title;
  final String? subtitle;
  final List<CardHistoryCardsEntity> cards;

  @override
  List<Object?> get props => [
        title,
        cards,
        subtitle,
      ];
}

class CardHistoryCardsEntity extends Equatable {
  const CardHistoryCardsEntity({
    required this.title,
    required this.icon,
    this.deeplink,
  });

  factory CardHistoryCardsEntity.fromJson(dynamic json) {
    return CardHistoryCardsEntity(
      title: json['title'],
      icon: json['icon'],
      deeplink: json['deeplink'],
    );
  }

  final String title;
  final String icon;
  final String? deeplink;

  @override
  List<Object?> get props => [
        title,
        icon,
        deeplink,
      ];
}
