import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tcc_mobile/commons/debugging/features/menu/presentation/menu_page.dart';
import 'package:tcc_mobile/commons/debugging/features/network/domain/network_interceptor.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/bloc/network_requests_cubit.dart';

class DebuggingSettings {
  DebuggingSettings._();

  static final DebuggingSettings _instance = DebuggingSettings._();

  static DebuggingSettings get instance => _instance;

  static const bool enabled = kDebugMode;

  Widget get debuggingPage => MenuPage(
        networkRequestsCubit: GetIt.I.get<NetworkRequestsCubit>()
          ..fetchNetworkRequests(),
      );

  Interceptor get interceptor => GetIt.I.get<NetworkInterceptor>();
}
