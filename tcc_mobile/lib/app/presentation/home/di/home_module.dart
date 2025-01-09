import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/home/data/repository/home_repository_impl.dart';
import 'package:tcc_mobile/app/presentation/home/domain/repository/home_repository.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/bloc/home_cubit.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/pages/home_page_factory.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/explorer_carousel/presentation/explorer_carousel_widget.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/widgets/history_cards/presentation/history_cards_widget.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/builder/component_builder.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/components_page_factory.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';
import 'package:tcc_mobile/commons/router/router.dart';

@module
abstract class HomeModule {
  @Named('HomePageFactory')
  ComponentsPageFactory providesHome(
    AppNavigator appNavigator,
    HomeCubit homeCubit,
    ComponentContentAdapterBuilder adapterBuilder,
  ) {
    _registerWidgetBuilders(adapterBuilder);
    return HomePageFactory()
      ..addNavigator(appNavigator)
      ..addHomeCubit(homeCubit)
      ..addAdapter(adapterBuilder.build());
  }

  void _registerWidgetBuilders(ComponentContentAdapterBuilder adapterBuilder) {
    adapterBuilder
      ..addBuilder('historyCards', (model) {
        final builder = GetIt.I.get<ComponentBuilder<HistoryCardsWidget>>();
        return builder.create(model);
      })
      ..addBuilder('explorerCarousel', (model) {
        final builder = GetIt.I.get<ComponentBuilder<ExplorerCarouselWidget>>();
        return builder.create(model);
      });
  }

  HomeRepository providesHomeRepository(ApiDataSourceDelegate delegate) =>
      HomeRepositoryImpl(
        delegate: delegate,
      );

  HomeCubit providesHomeCubit(HomeRepository repository) =>
      HomeCubit(repository: repository);
}
