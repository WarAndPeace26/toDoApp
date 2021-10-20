import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_model.dart';

part 'task_handling.dart';

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



class MyToDoList extends StatefulWidget {
  const MyToDoList({Key? key}) : super(key: key);

  @override
  State<MyToDoList> createState() => _MyToDoListState();
}
class _MyToDoListState extends State<MyToDoList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "To Do list"
        ),
      ),
      body: Consumer<ListModel>(
        builder: (context, toDoList, child){
          return ListView.builder(
            itemCount: toDoList.tasks.length,
            itemBuilder: (context, index){
              return ListTile(title: Text(toDoList.tasks[index].title),);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return Scaffold(
                  appBar: AppBar(
                    title: const Text("Add Task"),
                  ),
                  body: taskInsertionSequence(),
                );
              }
          );
        },
      ),
    );
  }
}