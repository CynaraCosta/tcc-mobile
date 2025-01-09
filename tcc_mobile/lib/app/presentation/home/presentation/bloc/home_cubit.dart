import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc_mobile/app/presentation/home/domain/repository/home_repository.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.repository,
  }) : super(const HomeInitialState());

  final HomeRepository repository;

  Future<void> getHome() async {
    emit(const HomeLoadingState());

    try {
      final result = await repository.getData();
      emit(HomeSuccessState(entity: result));
    } catch (_) {
      emit(const HomeErrorState());
    }
  }
}
