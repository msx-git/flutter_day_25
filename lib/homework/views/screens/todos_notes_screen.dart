import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_25/homework/notifiers/notes_notifier.dart';
import 'package:flutter_day_25/homework/notifiers/todos_notifier.dart';

class TodosNotesScreen extends StatelessWidget {
  const TodosNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos & Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notes"),
                IconButton(
                  onPressed: () {
                    NotesNotifier.of(context).addNote(
                      id: DateTime.now().hashCode,
                      title: "New note",
                      content: "Note content",
                      createdDate: DateTime.now(),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: NotesNotifier.of(context),
                builder: (context, child) {
                  return ListView.builder(
                    itemCount: NotesNotifier.of(context).notes.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(NotesNotifier.of(context).notes[index].title),
                        subtitle: Text(
                            "ID: ${NotesNotifier.of(context).notes[index].id.toString()}"),
                        trailing: IconButton(
                          onPressed: () {
                            NotesNotifier.of(context).deleteNote(
                              NotesNotifier.of(context).notes[index].id,
                            );
                          },
                          icon: const Icon(CupertinoIcons.delete),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Todos"),
                IconButton(
                  onPressed: () {
                    TodosNotifier.of(context).addTodo(
                      id: DateTime.now().hashCode,
                      title: 'Todo title',
                      description: 'Todo description',
                      date: DateTime.now(),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Expanded(
              child: ListenableBuilder(
                listenable: TodosNotifier.of(context),
                builder: (context, child) {
                  return ListView.builder(
                    itemCount: TodosNotifier.of(context).todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(TodosNotifier.of(context).todos[index].title),
                        subtitle: Text(
                            "ID: ${TodosNotifier.of(context).todos[index].id.toString()}"),
                        trailing: IconButton(
                          onPressed: () {
                            TodosNotifier.of(context).deleteTodo(
                              TodosNotifier.of(context).todos[index].id,
                            );
                          },
                          icon: const Icon(CupertinoIcons.delete),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget({super.key});

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: TodosNotifier.of(context),
        builder: (context, child) {
          return AlertDialog(
            title: const Text("Add todo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Todo title',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    labelText: 'Todo description',
                  ),
                ),
                Row(
                  children: [
                    Text(date.toString()),
                    TextButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            currentDate: DateTime.now(),
                            initialDate: date,
                          ).then((value) => setState(() => date = value!));
                        },
                        child: const Text('Set Date')),
                  ],
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ListenableBuilder(
                  listenable: TodosNotifier.of(context),
                  builder: (context, child) {
                    return TextButton(
                      onPressed: () {
                        TodosNotifier.of(context).addTodo(
                          id: DateTime.now().hashCode,
                          title: titleController.text.trim(),
                          description: descriptionController.text.trim(),
                          date: date,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    );
                  }),
            ],
          );
        });
  }
}
