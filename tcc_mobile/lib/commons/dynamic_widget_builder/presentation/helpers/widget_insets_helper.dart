import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/presentation/helpers/widget_edge_insets.dart';
import 'package:tcc_mobile/soma/soma.dart';

abstract class WidgetInsetsHelper {
  EdgeInsets defineWidgetInsets(SomaDesignTokens tokens, WidgetModel model);
}

class WidgetInsetsHelperImpl implements WidgetInsetsHelper {
  @override
  EdgeInsets defineWidgetInsets(SomaDesignTokens tokens, WidgetModel model) {
    if (model.style != null) {
      return WidgetEdgeInsets.fromWidgetBounds(
        spacing: tokens.spacings,
        bounds: model.style?.bounds,
      ).insets;
    } else {
      return EdgeInsets.symmetric(vertical: tokens.spacings.inline.xs);
    }
  }
}
