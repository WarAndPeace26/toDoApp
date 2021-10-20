import 'package:flutter/material.dart';
import 'package:todoapp/Utilities/models/data_classes.dart';

Task initTask = Task(title: "Running", isDone: false);

class ListModel extends ChangeNotifier{

  List<Task> tasks = <Task>[initTask, initTask, initTask];

  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}
