import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
}
