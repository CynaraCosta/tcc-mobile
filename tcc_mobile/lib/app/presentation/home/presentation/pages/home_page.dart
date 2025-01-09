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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: tokens.spacings.inline.xs,
                        ),
                        child: const LogoImageWidget(),
                      ),
                      ...widgets,
                    ],
                  ),
                );
              case const (HomeErrorState):
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
