import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/repository/shared_preferences_repository.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/bloc/network_requests_state.dart';

class NetworkRequestsCubit extends Cubit<NetworkRequestsState> {
  NetworkRequestsCubit({
    required this.repository,
  }) : super(const NetworkRequestsInitialState());

  final SharedPreferencesRepository repository;

  Future<void> fetchNetworkRequests() async {
    emit(const NetworkRequestsLoadingState());
    try {
      final data = await repository.findAll();
      emit(NetworkRequestsSuccessState(data));
    } catch (_) {
      emit(const NetworkRequestsErrorState());
    }
  }

  Future<void> deleteNetworkRequests() async {
    emit(const NetworkRequestsLoadingState());
    try {
      repository.deleteAll();
      emit(const NetworkRequestsSuccessState([]));
    } catch (_) {
      emit(const NetworkRequestsErrorState());
    }
  }
}
