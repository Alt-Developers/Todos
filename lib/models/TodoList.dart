import 'package:flutter/material.dart';
import 'Todo.dart';

class TodoList {
  final String listName;
  final Color listColor;
  final List<Todo> listItems;
  final String id;

  TodoList(
      {required this.listName,
      required this.listColor,
      required this.listItems,
      required this.id});
}
