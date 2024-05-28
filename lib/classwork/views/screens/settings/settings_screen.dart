import 'package:flutter/material.dart';

import '../../../notifiers/settings_notifier.dart';
import '../../widgets/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsNotifier.of(context).settings;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          ListenableBuilder(
            listenable: SettingsNotifier.of(context),
            builder: (context, child) {
              return SwitchListTile(
                title: const Text('Dark mode'),
                value: settings.themeMode == ThemeMode.dark,
                onChanged: (value) {
                  SettingsNotifier.of(context).switchTheme(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
