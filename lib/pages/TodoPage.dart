import "package:flutter/material.dart";
import "../widgets/Todo.dart";

class TodoPage extends StatelessWidget {
  final Color? color;
  final String listName;
  final List todos;

  const TodoPage(
      {Key? key,
      required this.listName,
      required this.color,
      required this.todos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            listName,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: color ?? Colors.grey[100],
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (ctx, index) {
              return Column(children: [
                Todo(
                  todoText: todos[index]["name"] as String,
                ),
              ]);
            },
          ),
        ));
  }
}
