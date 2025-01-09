import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/domain/entity/explorer_carousel_entity.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/presentation/builder/explorer_carousel_builder.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/presentation/explorer_carousel_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/builder/component_builder.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';
import '../domain/mapper/explorer_carousel_mapper.dart';

class ExplorerCarouselModule extends DynamicWidgetBuilderBaseModule<
    ExplorerCarouselEntity, ExplorerCarouselWidget> {
  @override
  FutureOr<void> init(GetItHelper gh) {
    super.init(gh);

    gh.factory<WidgetContentMapper<ExplorerCarouselEntity>>(
      () => providesMapper(),
    );

    gh.factory<ComponentBuilder<ExplorerCarouselWidget>>(() {
      final builder = ExplorerCarouselBuilder(
        provider: gh<WidgetContentCommand<ExplorerCarouselEntity>>(),
      );
      builder.addNavigator(gh<AppNavigator>());
      return builder;
    });
  }

  WidgetContentMapper<ExplorerCarouselEntity> providesMapper() =>
      ExplorerCarouselMapper();
}
