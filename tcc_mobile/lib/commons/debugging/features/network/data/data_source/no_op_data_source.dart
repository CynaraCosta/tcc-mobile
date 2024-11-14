import 'package:tcc_mobile/commons/debugging/features/network/data/models/debugging_model.dart';

class NoOpDataSource {
  Future<void> save(DebuggingModel model) => Future.value();
  Future<List<DebuggingModel>> findAll() => Future.value([]);
  Future<void> clear() => Future.value();
}
