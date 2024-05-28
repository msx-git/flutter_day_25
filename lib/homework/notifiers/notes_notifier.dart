import 'package:flutter/material.dart';
import 'package:flutter_day_25/homework/controllers/notes_controller.dart';

class NotesNotifier extends InheritedWidget {
  final NotesController notesController;

  const NotesNotifier({
    super.key,
    required this.notesController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant NotesNotifier oldWidget) {
    return oldWidget.notesController != notesController;
  }

  static NotesController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NotesNotifier>()!
        .notesController;
  }
}
