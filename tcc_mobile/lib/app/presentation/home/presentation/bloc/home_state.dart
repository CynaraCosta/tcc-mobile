import 'package:equatable/equatable.dart';
import 'package:tcc_mobile/app/presentation/home/domain/entities/home_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState() : super();
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState() : super();
}

class HomeErrorState extends HomeState {
  const HomeErrorState() : super();
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState({
    required this.entity,
  });
  final HomeEntity entity;

  @override
  List<Object?> get props => [entity];
}
