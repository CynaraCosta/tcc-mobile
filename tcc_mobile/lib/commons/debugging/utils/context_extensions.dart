import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension ContextExtensions on BuildContext {
  void pushWidget(Widget widget) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => widget));
  }

  TextTheme get textTheme => Theme.of(this).textTheme;

  Future<void> copyToClipboard(String textToCopy, {String? type}) async {
    await Clipboard.setData(ClipboardData(text: textToCopy)).then(
      (_) => ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(
            type != null ? '$type copied to clipboard' : 'Copied to clipboard',
          ),
        ),
      ),
    );
  }
}
