import "package:flutter/material.dart";
import "./Todo.dart";

class TodoList extends StatelessWidget {
  final List todos;
  final String listName;

  const TodoList({Key? key, required this.todos, required this.listName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: todos.length >= 10 ? 300 : todos.length * 70,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey[100]),
      child: ListView.builder(
        itemCount: todos.isEmpty ? 1 : todos.length + 1,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    listName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            );
          }
          index -= 1;
          return Column(children: [
            Todo(
              todoText: todos[index]["name"] as String,
            ),
          ]);
        },
      ),
    );
  }
}
