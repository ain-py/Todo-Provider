import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/todos_provider.dart';
import 'package:flutter_application_1/screens/first_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
} //DIO
// factory
//sharedPreference
//android premisson
//singalton
// FOROsNiTqry1n_pacpGyo

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = 'Todo - app';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: const MaterialApp(
        title: title,
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
