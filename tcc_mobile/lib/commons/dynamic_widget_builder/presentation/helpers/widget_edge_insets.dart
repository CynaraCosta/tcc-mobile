import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:tcc_mobile/commons/dynamic_widget_builder/dynamic_widget_builder_barrel.dart';
import 'package:tcc_mobile/soma/soma.dart';

final class WidgetEdgeInsets extends Equatable {
  const WidgetEdgeInsets({
    required this.insets,
  });

  factory WidgetEdgeInsets.fromWidgetBounds({
    required SomaSpacing spacing,
    WidgetBounds? bounds,
  }) {
    double parseSpaceValue(String? key, {required SomaSpacing spacing}) {
      final spacingMap = {
        'soma_spacing_inline_xxxs': spacing.inline.xxxs,
        'soma_spacing_inline_xxs': spacing.inline.xxs,
        'soma_spacing_inline_xs': spacing.inline.xs,
        'soma_spacing_inline_sm': spacing.inline.sm,
        'soma_spacing_inline_md': spacing.inline.md,
        'soma_spacing_inline_lg': spacing.inline.lg,
        'soma_spacing_inline_xl': spacing.inline.xl,
      };

      final value = spacingMap[key];
      return value ?? 0;
    }

    return WidgetEdgeInsets(
      insets: EdgeInsets.fromLTRB(
        parseSpaceValue(bounds?.left, spacing: spacing),
        parseSpaceValue(bounds?.top, spacing: spacing),
        parseSpaceValue(bounds?.right, spacing: spacing),
        parseSpaceValue(bounds?.bottom, spacing: spacing),
      ),
    );
  }

  final EdgeInsets insets;

  @override
  List<Object?> get props => [];
}
