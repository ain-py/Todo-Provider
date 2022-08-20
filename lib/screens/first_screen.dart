import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/widget/completed_list_widget.dart';
import 'package:flutter_application_1/widget/todo_form_widget.dart';
import 'package:flutter_application_1/widget/todo_list_widget.dart';
import '../widget/todo_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [const TodoListWidget(), const CompletedTaskWidget()];
    return Scaffold(
      appBar: AppBar(title: const Text(MyApp.title)),
      backgroundColor: const Color(0xFFC6C4C4),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.black.withOpacity(0.4),
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.kayaking), label: 'To-dos'),
      //     BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
      //   ],
      //   currentIndex: selectedIndex,
      //   onTap: (value) => setState(() {
      //     selectedIndex = value;
      //   }),
      // ),
      body: TodoDialogScreen(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (() => showDialog(
      //       context: context,
      //       builder: (_) => const AlertDialog(
      //             title: Text('Add todo\'s'),
      //             content: TodoDialogScreen(),
      //           ))),
      //   backgroundColor: Colors.amber,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
