import 'package:flutter/material.dart';
import 'package:tcc_mobile/commons/debugging/features/menu/utils/menu_tabs.dart';
import 'package:tcc_mobile/commons/debugging/features/network/presentation/network_requests_page.dart';
import 'package:tcc_mobile/commons/debugging/features/settings/settings_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menuTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: menuTabs
                .map(
                  (e) => Tab(
                    text: e.title,
                    icon: e.icon,
                  ),
                )
                .toList(),
          ),
        ),
        body: const TabBarView(
          children: [
            NetworkRequestsPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
