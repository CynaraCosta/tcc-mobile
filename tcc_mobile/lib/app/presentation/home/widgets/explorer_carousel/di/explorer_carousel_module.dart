import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/home/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/app/presentation/home/widgets/explorer_carousel/explorer_carousel_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import '../domain/mapper/explorer_carousel_mapper.dart';

class ExplorerCarouselModule extends DynamicWidgetBuilderBaseModule<
    ExplorerCarouselEntity, ExplorerCarouselWidget> {
  @override
  FutureOr<void> init(GetItHelper gh) {
    super.init(gh);

    gh.factory<WidgetContentMapper<ExplorerCarouselEntity>>(
      () => providesMapper(),
    );
  }

  WidgetContentMapper<ExplorerCarouselEntity> providesMapper() =>
      ExplorerCarouselMapper();
}
