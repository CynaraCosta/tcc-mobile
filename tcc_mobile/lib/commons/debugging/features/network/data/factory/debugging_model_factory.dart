import 'package:tcc_mobile/commons/debugging/features/network/data/models/debugging_model.dart';

abstract class DebuggingModelFactory {
  DebuggingModel createFromJson(Map<String, dynamic> json);
}
