import 'package:tcc_mobile/commons/debugging/features/network/data/factory/debugging_model_factory.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/api_response_model.dart';
import 'package:tcc_mobile/commons/debugging/features/network/data/models/debugging_model.dart';

class ApiResponseFactory implements DebuggingModelFactory {
  @override
  DebuggingModel createFromJson(Map<String, dynamic> json) {
    return ApiResponseModel.fromJson(json);
  }
}
