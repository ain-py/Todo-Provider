import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/todo_model.dart';
import 'package:flutter_application_1/provider/todos_provider.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:flutter_application_1/widget/completed_list_widget.dart';
import 'package:flutter_application_1/widget/todo_list_widget.dart';
import 'package:provider/provider.dart';
import 'todo_form_widget.dart';

class TodoDialogScreen extends StatefulWidget {
  /// chabge texttt
  const TodoDialogScreen({Key? key}) : super(key: key);

  @override
  State<TodoDialogScreen> createState() => _TodoDialogScreenState();
}

class _TodoDialogScreenState extends State<TodoDialogScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime _initialDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context, listen: true);
    void addTodo() {
      final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return;
      } else {
        final todo = Todo(
          createdTime: DateTime.now(),
          id: DateTime.now().toString(),
          title: title,
          description: description,
        );
        provider.addTodos(todo);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TodoListWidget()),
        );
      }
    }

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: provider.getDate,
          firstDate: DateTime(1989),
          lastDate: DateTime.now());
      if (picked != null && picked != _initialDate) {
        provider.pickedDate;
      }
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Form(
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
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CompletedTaskWidget()),
                    );
                  },
                  child: const Text("View completed tasks")),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TodoListWidget()),
                    );
                  },
                  child: const Text("View todos")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: const Text("View date picker"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Utils.showSnackBar(context, provider.getDate.toString());
                },
                child: const Text("Show picked date"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
