import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/bloc/network_requests_cubit.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/bloc/network_requests_state.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/widgets/network_request_feedback_widget.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/widgets/network_request_tile_widget.dart';
import 'package:tcc_mobile/commons/debugging/features/network_details/pages/network_request_details_page.dart';
import 'package:tcc_mobile/commons/debugging/utils/context_extensions.dart';

class NetworkRequestsPage extends StatelessWidget {
  const NetworkRequestsPage({
    required this.cubit,
    super.key,
  });

  final NetworkRequestsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: cubit.deleteNetworkRequests,
          child: const Icon(Icons.delete),
        ),
        body: BlocBuilder<NetworkRequestsCubit, NetworkRequestsState>(
          buildWhen: (previous, current) =>
              previous.runtimeType != current.runtimeType,
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (NetworkRequestsErrorState):
                return const NetworkRequestFeedbackWidget(
                  message: 'Existem erros ao carregar os dados',
                  iconData: Icon(
                    Icons.network_wifi,
                    size: 56,
                  ),
                );
              case const (NetworkRequestsSuccessState):
                state as NetworkRequestsSuccessState;
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 16),
                      sliver: SliverList.separated(
                        itemBuilder: (_, index) {
                          final model = state.data[index] as ApiResponseModel;
                          return NetworkRequestTile(
                            model: model,
                            onTap: () {
                              context.pushWidget(
                                NetworkRequestDetailsPage(model: model),
                              );
                            },
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                        itemCount: state.data.length,
                      ),
                    ),
                  ],
                );
              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}
