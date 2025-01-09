import 'package:tcc_mobile/app/presentation/home/data/models/home_model.dart';
import 'package:tcc_mobile/app/presentation/home/domain/entities/home_entity.dart';
import 'package:tcc_mobile/app/presentation/home/domain/repository/home_repository.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';
import 'package:tcc_mobile/commons/network/data/request_params.dart';
import 'package:tcc_mobile/commons/network/data/request_type.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl({
    required this.delegate,
  });

  final ApiDataSourceDelegate delegate;

  @override
  Future<HomeEntity> getData() async {
    return await delegate
        .fetchAsFuture<HomeModel>(
          params: const RequestParams(
            endpoint: '/v1/home',
            requestType: RequestType.get,
          ),
          mapper: HomeModel.fromJson,
        )
        .then((value) => value.toEntity());
  }
}
