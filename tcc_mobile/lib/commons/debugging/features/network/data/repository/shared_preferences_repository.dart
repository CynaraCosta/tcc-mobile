import 'package:tcc_mobile/commons/debugging/features/network/data/data_source/no_op_data_source.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/data_source/shared_preferences_data_source.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/debugging_model.dart';
import 'package:tcc_mobile/commons/debugging/settings/debugging_settings.dart';

abstract class SharedPreferencesRepository {
  Future<void> save(DebuggingModel model);
  Future<List<DebuggingModel>> findAll();
  Future<void> deleteAll();
}

class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  SharedPreferencesRepositoryImpl(
    this._dataSource,
    this._noOpDataSource,
  );

  final SharedPreferencesDataSource _dataSource;
  final NoOpDataSource _noOpDataSource;

  @override
  Future<void> deleteAll() async {
    DebuggingSettings.enabled ? _dataSource.clear() : _noOpDataSource.clear();
  }

  @override
  Future<List<DebuggingModel>> findAll() async {
    return DebuggingSettings.enabled
        ? _dataSource.findAll()
        : _noOpDataSource.findAll();
  }

  @override
  Future<void> save(DebuggingModel model) async {
    DebuggingSettings.enabled
        ? _dataSource.save(model)
        : _noOpDataSource.save(model);
  }
}
