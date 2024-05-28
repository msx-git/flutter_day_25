import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodosController with ChangeNotifier {
  final List<Todo> _list = [
    Todo(
      id: 1,
      title: "Finish homework",
      description: "Todos & Notes project",
      date: DateTime.now(),
    ),
  ];

  List<Todo> get todos {
    return [..._list];
  }

  void addTodo({
    required int id,
    required String title,
    required String description,
    required DateTime date,
  }) {
    final newTodo = Todo(
      id: id,
      title: title,
      description: description,
      date: date,
    );
    _list.add(newTodo);
    notifyListeners();
  }

  void deleteTodo(int id){
    _list.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleTodo({required int id}) {
    for (var todo in _list) {
      if (todo.id == id) {
        todo.isCompleted = !todo.isCompleted;
        break;
      }
    }
  }
}
