import 'package:tcc_mobile/app/presentation/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<HomeEntity> getData();
}
