import "package:flutter/material.dart";
import 'package:collection/collection.dart';
import "./Todo.dart";

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> _todos = [
    "very good very niiiii",
    "very good very nieeee",
    "Haiyaaaa",
    "fish go blub"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
        child: SizedBox(
            height: 500,
            child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (ctx, index) {
                  print(index);
                  return Todo(todoText: _todos[index], key: UniqueKey());
                })));
  }
}
