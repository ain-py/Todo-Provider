import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_model.dart';
import 'package:flutter_application_1/provider/todos_provider.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  /// Creates a todo [widget]
  const TodoWidget({Key? key, required this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: buildTodos(context),
      );

  Widget buildTodos(BuildContext context) => Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              value: todo.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo);
                Utils.showSnackBar(context,
                    isDone ? "Task completed" : "Task marked incomplete");
              },
              activeColor: Colors.black,
              checkColor: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  if (todo.description.isNotEmpty)
                    Text(
                      todo.description,
                      style: const TextStyle(fontSize: 20, height: 1.5),
                    )
                ],
              ),
            )
          ],
        ),
      );
  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the todo');
  }
}
