// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:todos/widgets/PinnedTodos.dart';
import 'package:todos/widgets/TodoListCollapsed.dart';
import "./widgets/TodoList.dart";
import "./widgets/NewTodo.dart";

void main() => runApp(MyApp());

final ThemeData theme = ThemeData();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
      ).copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.blue),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final _pinnedTodos = [
    {
      "listName": "School",
      "color": Colors.yellow[50],
      "listItems": [
        {"name": "📚 Study for 2 hours."},
        {"name": "🔎 Research for school project. Like very much"},
      ],
    },
    {
      "listName": "Grocheries",
      "color": Colors.blue[50],
      "listItems": [
        {"name": "🥕  Carrots"},
        {"name": "🥦  Brocolli"},
        {"name": "🍎 Apples"},
        {"name": "🍎 Apples"},
        {"name": "🍊 Oranges"},
        {"name": "🥕  Carrots"},
        {"name": "🥦  Brocolli"},
        {"name": "🍎 Apples"},
        {"name": "🍎 Apples"},
        {"name": "🍊 Oranges"},
      ],
    }
  ];
  final _normalTodos = [
    {
      "listName": "2022 Goals",
      "color": Colors.yellow[50],
      "listItems": [
        {"name": "🏔️ Climb Mount Everest"},
        {"name": "🤑 Raise paycheck"},
      ],
    },
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
      ),
      drawer: Drawer(
        child: Text("Hello"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PinnedTodos(pinnedTodoLists: _pinnedTodos),
            TodoListCollapsed(),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => _addNewTodo(context),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
