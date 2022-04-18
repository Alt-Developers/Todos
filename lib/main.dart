// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import "./widgets/TodoList.dart";
import "./widgets/NewTodo.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final _todos = [
    {"name": "🥕  Carrots"},
    {"name": "🥦  Brocolli"},
    {"name": "🍎 Apples"},
    {"name": "🍎 Apples"},
  ];

  void _addNewTodo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => NewTodo(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: Colors.grey[100],
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Todos",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const <Widget>[
          // Container(
          //   margin: EdgeInsets.all(15),
          //   width: 40,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     color: Colors.blueAccent,
          //   ),
          //   child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          // )
        ],
      ),
      drawer: Drawer(
        child: Text("Hello"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TodoList(todos: _todos, listName: "Grocheries",),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => _addNewTodo(context),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.all(20),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
