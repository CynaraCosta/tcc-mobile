import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import '../entity/explorer_carousel_entity.dart';

class ExplorerCarouselMapper
    extends WidgetContentMapper<ExplorerCarouselEntity> {
  @override
  ExplorerCarouselEntity mapToContent(dynamic model) {
    return ExplorerCarouselEntity.fromJson(model);
  }
}
