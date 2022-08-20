import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedDescription,
    required this.onChangedTitle,
    required this.onSavedTodo,
  }) : super(key: key);
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          buildTitle(),
          const SizedBox(
            height: 10,
          ),
          buildDesciption(),
          const SizedBox(
            height: 10,
          ),
          buildButton(),
        ]),
      );
  Widget buildTitle() {
    return TextFormField(
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Title'),
      initialValue: title,
      validator: (title) {
        if (title!.isEmpty) {
          return 'title cannot be empty';
        } else {
          return null;
        }
      },
      onChanged: onChangedTitle,
    );
  }

  Widget buildDesciption() {
    return TextFormField(
      maxLines: 3,
      decoration: const InputDecoration(
          border: UnderlineInputBorder(), labelText: 'Desciption'),
      initialValue: description,
      onChanged: onChangedDescription,
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSavedTodo,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        child: const Text('Save'),
      ),
    );
  }
}
