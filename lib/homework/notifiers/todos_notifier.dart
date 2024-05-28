import 'package:flutter/material.dart';

import '../controllers/todos_controller.dart';

class TodosNotifier extends InheritedWidget {
  final TodosController todosController;

  const TodosNotifier({
    super.key,
    required this.todosController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant TodosNotifier oldWidget) {
    return oldWidget.todosController != todosController;
  }

  static TodosController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TodosNotifier>()!
        .todosController;
  }


}
