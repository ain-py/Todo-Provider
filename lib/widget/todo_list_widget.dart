import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/models/todo_model.dart';
import 'package:flutter_application_1/provider/todos_provider.dart';
import 'package:flutter_application_1/widget/todo_widget.dart';
import 'package:provider/provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //  final provider = Provider.of<TodosProvider>(context);
    //  provider.dispose();
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Completed tasks"),
          ),
          body: Consumer<TodosProvider>(
            builder: (context, provider, child) => provider.todos.isEmpty
                ? const Center(
                    child: Text(
                    "No todos",
                    style: TextStyle(fontSize: 20),
                  ))
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    physics: const BouncingScrollPhysics(),
                    itemCount: provider.todos.length,
                    separatorBuilder: ((context, index) => Container(
                          height: 12,
                        )),
                    itemBuilder: (context, index) {
                      final todo = provider.todos[index];
                      return TodoWidget(todo: todo);
                    },
                  ),
          )),
    );
  }
}
