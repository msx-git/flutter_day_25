import 'package:flutter/material.dart';
import 'package:flutter_day_25/homework/controllers/notes_controller.dart';
import 'package:flutter_day_25/homework/controllers/todos_controller.dart';
import 'package:flutter_day_25/homework/notifiers/notes_notifier.dart';
import 'package:flutter_day_25/homework/notifiers/todos_notifier.dart';
import 'package:flutter_day_25/homework/views/screens/todos_notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NotesNotifier(
      notesController: NotesController(),
      child: TodosNotifier(
        todosController: TodosController(),
        child:  const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: TodosNotesScreen(),
        ),
      ),
    );
  }
}
