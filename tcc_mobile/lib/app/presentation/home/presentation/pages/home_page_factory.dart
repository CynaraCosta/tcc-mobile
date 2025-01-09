import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/bloc/home_cubit.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/pages/home_page.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/components_page_factory.dart';
import 'package:tcc_mobile/commons/router/router.dart';

class HomePageFactory extends ComponentsPageFactory {
  HomePageFactory();

  late AppNavigator navigator;
  late HomeCubit homeCubit;

  void addNavigator(AppNavigator navigator) {
    this.navigator = navigator;
  }

  void addHomeCubit(HomeCubit homeCubit) {
    this.homeCubit = homeCubit;
  }

  @override
  void addAdapter(ComponentContentAdapter adapter) {
    this.adapter = adapter;
  }

  @override
  Widget create([params]) {
    return HomePage(
      navigator: navigator,
      adapter: adapter,
      homeCubit: homeCubit,
    );
  }
}
