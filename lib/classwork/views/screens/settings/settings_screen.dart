import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../notifiers/settings_notifier.dart';
import '../home/home_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = SettingsNotifier.of(context).settings;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: Drawer(
        child: DrawerHeader(
          child: Column(
            children: [
              const Text('Menyu'),
              ListTile(
                onTap: () => Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                ),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () => Navigator.of(context).pushReplacement(
                  CupertinoPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                ),
                title: const Text('Settings'),
              )
            ],
          ),
        ),
      ),
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
