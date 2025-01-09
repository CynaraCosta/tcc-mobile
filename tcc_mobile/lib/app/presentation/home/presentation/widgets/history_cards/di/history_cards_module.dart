import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import '../domain/entity/history_cards_entity.dart';
import '../domain/mapper/history_cards_mapper.dart';
import '../history_cards_widget.dart';

class HistoryCardsModule extends DynamicWidgetBuilderBaseModule<
    HistoryCardsEntity, HistoryCardsWidget> {
  @override
  FutureOr<void> init(GetItHelper gh) {
    gh.factory<WidgetContentMapper<HistoryCardsEntity>>(
      () => providesMapper(),
    );
    return super.init(gh);
  }

  WidgetContentMapper<HistoryCardsEntity> providesMapper() =>
      HistoryCardsMapper();
}
