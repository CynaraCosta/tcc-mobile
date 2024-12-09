import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/domain/mapper/widget_content_request_mapper.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/network/api_data_source_delegate.dart';

abstract class DynamicWidgetBuilderBaseModule<E, W extends Widget>
    extends MicroPackageModule {
  @override
  FutureOr<void> init(GetItHelper gh) {
    gh.factory<WidgetContentCommand<E>>(() {
      final WidgetContentRequestMapper loadContentMapper =
          WidgetLoadContentRequestMapper();

      final repository = ContentRepositoryDefault(
        RemoteContentDataSource(
          gh<ApiDataSourceDelegate>(),
        ),
      );

      final componentContentByWidgetStrategyFactory =
          DefaultContentByWidgetStrategyFactory()
            ..addStrategy(
              GetContentByWidgetErrorStrategy(),
            )
            ..addStrategy(GetContentByWidgetDataStrategy())
            ..addStrategy(
              GetContentByWidgetLoadingStrategy(repository),
            );

      return GetContentCommandDefault(
        gh<WidgetContentMapper<E>>(),
        loadContentMapper,
        componentContentByWidgetStrategyFactory.create(),
      );
    });
  }
}
