import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/pages/todolist/list_model.dart';
import 'pages/todolist/to_do_list.dart';

void main() {
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => ListModel(),
        builder: (context, _ ) => const MyToDoList(),
      ),
    );
  }
}
