import 'package:flutter/material.dart';
import 'package:flutter_day_25/classwork/controllers/settings_controller.dart';
import 'package:flutter_day_25/classwork/notifiers/settings_notifier.dart';
import 'package:flutter_day_25/classwork/views/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SettingsNotifier(
      settingsController: SettingsController(),
      child: Builder(builder: (context) {
        return ListenableBuilder(
          listenable: SettingsNotifier.of(context),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData.dark(),
              themeMode: SettingsNotifier.of(context).settings.themeMode,
              home: const HomeScreen(),
            );
          }
        );
      }),
    );
  }
}
