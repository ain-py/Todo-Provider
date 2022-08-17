import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_model.dart';
import 'package:flutter_application_1/provider/todos_provider.dart';
import 'package:provider/provider.dart';
import 'todo_form_widget.dart';

class TodoDialogScreen extends StatefulWidget {
  /// Todo dialog screen
  const TodoDialogScreen({Key? key}) : super(key: key);

  @override
  State<TodoDialogScreen> createState() => _TodoDialogScreenState();
}

class _TodoDialogScreenState extends State<TodoDialogScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    void addTodo() {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      } else {
        final todo = Todo(
            createdTime: DateTime.now(),
            id: DateTime.now().toString(),
            title: title,
            description: description);
        print(todo.title);
        final provider = Provider.of<TodosProvider>(context, listen: false);
        provider.addTodos(todo);
        Navigator.of(context).pop();
      }
    }

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8,
          ),
          TodoFormWidget(
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSavedTodo: addTodo,
          ),
        ],
      ),
    );
  }
}
