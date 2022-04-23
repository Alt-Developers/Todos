import 'package:provider/provider.dart';
import "package:flutter/material.dart";
import '../widgets/TodoItem.dart';
import "../providers/TodoProvider.dart";

class TodoPage extends StatefulWidget {
  static const routeName = "/todo-page";

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late TextEditingController _controller;
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    final todoListId = ModalRoute.of(context)?.settings.arguments as String;
    final todoList =
        Provider.of<TodoProvider>(context).findTodoListById(todoListId);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            todoList.listName,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(isPinned ? Icons.push_pin : Icons.push_pin_outlined),
                onPressed: () {
                  setState(() {
                    isPinned = !isPinned;
                  });
                }),
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
        floatingActionButton: Container(
          decoration: BoxDecoration(
          color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          height: 70,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          padding: const EdgeInsets.all(10),
          child: TextField(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                        listId: todoListId,
                        todoText: todoList.listItems[index].name,
                        isChecked: todoList.listItems[index].isChecked,
                        id: todoList.listItems[index].id,
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
