import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/app/presentation/home/data/repository/home_repository_impl.dart';
import 'package:tcc_mobile/app/presentation/home/domain/repository/home_repository.dart';
import 'package:tcc_mobile/app/presentation/home/presentation/bloc/home_cubit.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';

@module
abstract class HomeModule {
  HomeRepository providesHomeRepository(ApiDataSourceDelegate delegate) =>
      HomeRepositoryImpl(
        delegate: delegate,
      );

  HomeCubit providesHomeCubit(HomeRepository repository) =>
      HomeCubit(repository: repository);
}
