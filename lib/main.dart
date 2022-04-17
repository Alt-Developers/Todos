// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import "./widgets/TodoList.dart";

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Colors.grey[100],
          title: Text(
            "Todos",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent,
              ),
              child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            )
          ],
        ),
        body: Column(children: const <Widget>[TodoList()]));
  }
}
