import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/widget/todo_widget.dart';
import 'package:provider/provider.dart';

import '../provider/todos_provider.dart';

class CompletedTaskWidget extends StatelessWidget {
  const CompletedTaskWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;
    return todos.isEmpty
        ? const Center(
            child: Text(
            "No completed tasks",
            style: TextStyle(fontSize: 20),
          ))
        : ListView.separated(
            padding: const EdgeInsets.all(20),
            physics: const BouncingScrollPhysics(),
            itemCount: todos.length,
            separatorBuilder: ((context, index) => Container(
                  height: 12,
                )),
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
          );
  }
}
