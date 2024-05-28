import 'package:flutter/material.dart';
import 'package:flutter_day_25/classwork/models/settings.dart';

class SettingsController with ChangeNotifier {
  final Settings settings = Settings(themeMode: ThemeMode.system);

  void switchTheme(bool isDark) {
    if (isDark) {
      settings.themeMode = ThemeMode.dark;
    } else {
      settings.themeMode = ThemeMode.light;
    }
    notifyListeners();
  }
}
