import 'package:flutter/material.dart';
import "package:flutter/foundation.dart";

import "../models/Todo.dart";
import "../models/TodoList.dart";

class TodoProvider extends ChangeNotifier {
  final List<TodoList> _pinnedTodos = [
    TodoList(
      id: "aosidjodijad",
      listName: "School",
      listColor: Colors.yellow[50] as Color,
      listItems: [
        Todo(name: "📚 Study for 2 hours."),
        Todo(name: "🔎 Research for school project. Like very much"),
      ],
    ),
  ];

  final List<TodoList> _normalTodos = [
    TodoList(
      id: "asdjodijxcv",
      listName: "School",
      listColor: Colors.yellow[50] as Color,
      listItems: [
        Todo(name: "📚 Study for 2 hours."),
        Todo(name: "🔎 Research for school project. Like very much"),
      ],
    ),
  ];

  List<TodoList> get pinnedTodos {
    return [..._pinnedTodos];
  }

  List<TodoList> get normalTodos {
    return [..._normalTodos];
  }

  TodoList findTodoListById(String id) {
    return _pinnedTodos.firstWhere((todoList) => todoList.id == id);
  }
}
