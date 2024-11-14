import 'package:flutter/material.dart';

class XDebuggingTabIcon {
  XDebuggingTabIcon({
    required this.title,
    required this.icon,
  });

  final String title;
  final Icon icon;
}

final List<XDebuggingTabIcon> menuTabs = [
  XDebuggingTabIcon(
    title: 'Network',
    icon: const Icon(
      Icons.network_wifi_rounded,
    ),
  ),
  XDebuggingTabIcon(
    title: 'Settings',
    icon: const Icon(
      Icons.settings,
    ),
  ),
];
