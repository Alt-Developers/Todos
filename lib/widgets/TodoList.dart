import "package:flutter/material.dart";
import 'package:todos/pages/TodoPage.dart';
// import "NewTodo.dart";
import "./Todo.dart";

class TodoList extends StatelessWidget {
  final List todos;
  final String listName;
  final Color? color;

  TodoList({Key? key, required this.todos, required this.listName, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: todos.length >= 10 ? 300 : todos.length * 70,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      width: 800,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color ?? Colors.grey[100]),
      child: ListView.builder(
        itemCount: todos.isEmpty ? 1 : todos.length + 1,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoPage(
                            listName: listName,
                            color: color,
                            todos: todos,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.edit),
                  ),
                ],
              ),
            );
          }
          index -= 1;
          return Expanded(
            child: Column(children: [
              Todo(
                todoText: todos[index]["name"] as String,
              ),
              Divider(color: Colors.grey[300])
            ]),
          );
        },
      ),
    );
  }
}
