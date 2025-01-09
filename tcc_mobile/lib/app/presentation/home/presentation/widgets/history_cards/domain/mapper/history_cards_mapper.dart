import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import '../entity/history_cards_entity.dart';

class HistoryCardsMapper extends WidgetContentMapper<HistoryCardsEntity> {
  @override
  HistoryCardsEntity mapToContent(dynamic model) {
    return HistoryCardsEntity.fromJson(model);
  }
}