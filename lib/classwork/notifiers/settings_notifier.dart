import 'package:flutter/material.dart';
import 'package:flutter_day_25/classwork/controllers/settings_controller.dart';

class SettingsNotifier extends InheritedWidget {
  final SettingsController settingsController;

  const SettingsNotifier({
    super.key,
    required this.settingsController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant SettingsNotifier oldWidget) {
    return oldWidget.settingsController != settingsController;
  }

  static SettingsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsNotifier>()!
        .settingsController;
  }
}
