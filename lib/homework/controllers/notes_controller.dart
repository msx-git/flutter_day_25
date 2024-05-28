import 'package:flutter/material.dart';

import '../models/note.dart';

class NotesController with ChangeNotifier {
  final List<Note> _list = [
    Note(
      id: 1,
      title: "Finish homework",
      content: "Todos & Notes project",
      createdDate: DateTime.now(),
    ),
  ];

  List<Note> get notes {
    return [..._list];
  }

  void addNote({
    required int id,
    required String title,
    required String content,
    required DateTime createdDate,
  }) {
    final newNote = Note(
      id: id,
      title: title,
      content: content,
      createdDate: createdDate,
    );
    _list.add(newNote);
    notifyListeners();
  }

  void deleteNote(int id){
    _list.removeWhere((note) => note.id == id);
    notifyListeners();
  }

}
