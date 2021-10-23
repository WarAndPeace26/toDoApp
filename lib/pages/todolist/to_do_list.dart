import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'list_model.dart';
import 'package:todoapp/Utilities/models/data_classes.dart';
import 'package:intl/intl.dart';

part 'task_handling.dart';


class MyToDoList extends StatefulWidget {
  const MyToDoList({Key? key}) : super(key: key);

  @override
  State<MyToDoList> createState() => _MyToDoListState();
}
class _MyToDoListState extends State<MyToDoList> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ListModel>(
      builder: (context, toDoList, child){
        return Scaffold(
          appBar: AppBar(
            title: const Text("To Do list"),
          ),
          body: ListView.builder(
            itemCount: toDoList.tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: GestureDetector(
                    child: Text(toDoList.tasks[index].title),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context){
                            return TaskEditor(
                              task: toDoList.tasks[index],
                              listModel: toDoList,
                            );
                          }
                      );
                    }
                ),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return TaskEditor(listModel: toDoList,);
                  });
            },
          ),
        );
      },
    );
  }
}