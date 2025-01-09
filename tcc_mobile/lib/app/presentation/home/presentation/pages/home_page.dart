import 'package:flutter/material.dart' hide WidgetState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/bloc/home_cubit.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/bloc/home_state.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/router/src/app_navigator.dart';
import 'package:tcc_mobile/soma/soma.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.navigator,
    required this.adapter,
    required this.homeCubit,
    super.key,
  });

  final AppNavigator navigator;
  final ComponentContentAdapter adapter;
  final HomeCubit homeCubit;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeCubit.getHome();
    super.initState();
  }

  @override
  void dispose() {
    widget.homeCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: tokens.spacings.inline.md,
          horizontal: tokens.spacings.inline.xs,
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => widget.homeCubit),
          ],
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case const (HomeSuccessState):
                  final data = (state as HomeSuccessState).entity;
                  final widgets = List.generate(data.widgets.length, (index) {
                    final model = data.widgets[index];
                    return widget.adapter.bindWidget(model);
                  });
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LogoImageWidget(),
                        ...widgets,
                        // widgets,
                        // ExplorerCarouselWidget(
                        //   model: const WidgetModel(
                        //     id: 'explorer-carousel',
                        //     path: '/v1/explorer-carousel',
                        //     state: WidgetState.loading,
                        //     data: {},
                        //   ),
                        //   provider: carouselProvider,
                        //   navigator: navigator,
                        // ),
                        SizedBox(
                          height: tokens.spacings.inline.md,
                        ),
                      ],
                    ),
                  );
                case const (HomeErrorState):
                  return const SizedBox.shrink();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
