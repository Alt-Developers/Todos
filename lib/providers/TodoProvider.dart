import 'package:flutter/material.dart';

import "../models/Todo.dart";
import "../models/TodoList.dart";

class TodoProvider extends ChangeNotifier {
  final List<TodoList> pinnedTodos = [
    TodoList(
      id: "asdjodijxcv",
      listName: "School",
      listColor: Colors.yellow[50] as Color,
      listItems: [
        Todo(name: "📚 Study for 2 hours.", id: "iausocvv", isChecked: false),
        Todo(
          name: "🔎 Research for school project. Like very much",
          id: "iasxcvbusocvv",
          isChecked: false,
        ),
        Todo(name: "😭 Hello", id: "iausasdxvocvv", isChecked: true),
      ],
    ),
        TodoList(
      id: "vbvbfbbdfdfbv",
      listName: "School",
      listColor: Colors.blue[50] as Color,
      listItems: [
        Todo(name: "📚 Study for 2 hours.", id: "dfbvcbcbvb", isChecked: false),
        Todo(
          name: "🔎 Research for school project. Like very much",
          id: "iasxcvbusocvv",
          isChecked: false,
        ),
        Todo(name: "😭 Hello", id: "fbdfbcvbcv", isChecked: true),
      ],
    ),
  ];
  

  TodoList findTodoListById(String id) {
    return pinnedTodos.firstWhere((todoList) => todoList.id == id);
  }

  void setIsChecked(String todoListId, String todoId, bool value) {
   final _todoListOfId = pinnedTodos.firstWhere((todoList) => todoList.id == todoListId);
   final _todoOfId = _todoListOfId.listItems.firstWhere((todo) => todo.id == todoId);

   _todoOfId.isChecked = value;
  //  notifyListeners();
  }
}
