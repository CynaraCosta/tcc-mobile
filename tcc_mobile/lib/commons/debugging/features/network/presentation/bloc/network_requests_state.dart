import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/debugging_model.dart';

abstract class NetworkRequestsState extends Equatable {
  const NetworkRequestsState();
  @override
  List<Object?> get props => [];
}

class NetworkRequestsInitialState extends NetworkRequestsState {
  const NetworkRequestsInitialState() : super();
}

class NetworkRequestsLoadingState extends NetworkRequestsState {
  const NetworkRequestsLoadingState() : super();
}

class NetworkRequestsSuccessState extends NetworkRequestsState {
  const NetworkRequestsSuccessState(this.data) : super();
  final List<DebuggingModel> data;

  @override
  List<Object?> get props => [data];
}

class NetworkRequestsErrorState extends NetworkRequestsState {
  const NetworkRequestsErrorState() : super();
}