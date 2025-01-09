import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/presentation/builder/history_cards_builder.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/builder/component_builder.dart';
import 'package:tcc_mobile/commons/router/router.dart';
import '../domain/entity/history_cards_entity.dart';
import '../domain/mapper/history_cards_mapper.dart';
import '../presentation/history_cards_widget.dart';

class HistoryCardsModule extends DynamicWidgetBuilderBaseModule<
    HistoryCardsEntity, HistoryCardsWidget> {
  @override
  FutureOr<void> init(GetItHelper gh) {
    gh.factory<WidgetContentMapper<HistoryCardsEntity>>(
      () => providesMapper(),
    );

    gh.factory<ComponentBuilder<HistoryCardsWidget>>(() {
      final builder = HistoryCardsBuilder(
        provider: gh<WidgetContentCommand<HistoryCardsEntity>>(),
      );
      builder.addNavigator(gh<AppNavigator>());
      return builder;
    });
    return super.init(gh);
  }

  WidgetContentMapper<HistoryCardsEntity> providesMapper() =>
      HistoryCardsMapper();
}
