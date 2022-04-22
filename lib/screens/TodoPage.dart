import 'package:provider/provider.dart';
import "package:flutter/material.dart";
import '../widgets/TodoItem.dart';
import "../providers/TodoProvider.dart";

class TodoPage extends StatelessWidget {
  static const routeName = "/todo-page";

  @override
  Widget build(BuildContext context) {
    final todoListId = ModalRoute.of(context)?.settings.arguments as String;
    final todoList = Provider.of<TodoProvider>(context, listen: false)
        .findTodoListById(todoListId);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            todoList.listName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (_) {},
              itemBuilder: (BuildContext context) {
                return {'Logout', 'Settings'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: todoList.listColor,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Container(
          color: Colors.grey[100],
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: todoList.listItems.length,
            itemBuilder: (ctx, index) {
              return Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      TodoItem(
                        groupId: todoList.listName,
                        todoText: todoList.listItems[index].name,
                      ),
                      Divider(color: Colors.grey[300])
                    ]),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
