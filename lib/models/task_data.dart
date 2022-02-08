import 'package:c_work/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  final db = FirebaseFirestore.instance;


  List<Task> _tasks = [

  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task newTaskTitle) {
    db.collection('tasks').add(newTaskTitle.toDbJson(),);
    _tasks.add(newTaskTitle);
    notifyListeners();
  }

  void updateTask(Task task)async {
    task.toggleDone();
    var taskSnapshot = await db.collection('tasks').where('uid', isEqualTo: task.uid).where('name', isEqualTo: task.name).get();
    for(var _task in taskSnapshot.docs){
      await _task.reference.update({'isDone': task.isDone});
    }
    notifyListeners();
  }

  void deleteTask(Task task) async{
    var taskSnapshot = await db.collection('tasks').where('uid', isEqualTo: task.uid).where('name', isEqualTo: task.name).get();
    for(var _task in taskSnapshot.docs){
      await _task.reference.delete();
    }
    _tasks.remove(task);
    notifyListeners();
  }

  void fetchData(var user) async{
    var taskSnapshot = await db.collection('tasks').where('uid', isEqualTo: user.uid).get();
    for(var _task in taskSnapshot.docs){
      Task obj = Task(name: _task.data()['name'], uid: _task.data()['uid'], isDone: _task.data()['isDone']);
      _tasks.add(obj);
    }
    notifyListeners();
  }

  void clear(){
    _tasks.clear();
  }



}
