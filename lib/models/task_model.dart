import 'package:flutter/material.dart';
import 'package:todo_app/models/catagory_model.dart';

class Task {
  final String taskName;
  final Category category;
  final String note;
  final DateTime date;
  final IconData icon;

  Task({this.taskName, this.date, this.category, this.note, this.icon});
}

List<Task> tasks = [
  Task(
      taskName: "Task1",
      category: Category("Work"),
      note: "Note1",
      date: DateTime.now(),
      icon: Icons.looks_one),
  Task(
      taskName: "Task2",
      category: Category("Study"),
      note: "buraya gel oraya git ama aşağı inme yukarı çık",
      date: DateTime(2020, 10, 26),
      icon: Icons.school),
];
