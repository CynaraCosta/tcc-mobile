import 'package:equatable/equatable.dart';

class ExplorerCarouselEntity extends Equatable {
  const ExplorerCarouselEntity({
    required this.title,
    required this.cards,
  });

  factory ExplorerCarouselEntity.fromJson(dynamic json) {
    return ExplorerCarouselEntity(
      title: json['title'],
      cards: (json['cards'] as List)
          .map((card) => CardExplorerCarouselEntity.fromJson(card))
          .toList(),
    );
  }

  final String title;
  final List<CardExplorerCarouselEntity> cards;

  @override
  List<Object?> get props => [
        title,
        cards,
      ];
}

class CardExplorerCarouselEntity extends Equatable {
  const CardExplorerCarouselEntity({
    required this.title,
    required this.icon,
    this.subtitle,
    this.deeplink,
  });

  factory CardExplorerCarouselEntity.fromJson(dynamic json) {
    return CardExplorerCarouselEntity(
      title: json['title'],
      icon: json['icon'],
      subtitle: json['subtitle'],
      deeplink: json['deeplink'],
    );
  }

  final String title;
  final String? subtitle;
  final String icon;
  final String? deeplink;

  @override
  List<Object?> get props => [
        title,
        subtitle,
        icon,
        deeplink,
      ];
}
