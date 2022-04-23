import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'TodoListItem.dart';
import "../models/Todo.dart";
import 'package:provider/provider.dart';
import "../providers/TodoProvider.dart";

class PinnedTodos extends StatefulWidget {
  const PinnedTodos({Key? key})
      : super(key: key);

  @override
  _PinnedTodosState createState() => _PinnedTodosState();
}

class _PinnedTodosState extends State<PinnedTodos> {
  var pageIndex = 0;

  void onSwiperSwipped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _pinnedTodos =  Provider.of<TodoProvider>(context).pinnedTodos;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 30, bottom: 0, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              const Text(
                "Pinned Lists",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text("${pageIndex + 1} / ${_pinnedTodos.length}"),
            ],
          ),
        ),
        SizedBox(
          height: 350,
          width: 800,
          child: Swiper(
            onIndexChanged: onSwiperSwipped,
            itemBuilder: (BuildContext context, int index) {
              print("${_pinnedTodos[index]} aosidjoaidjj");
              // return TodoListItem(todos: [Todo(name: "hello")], listName: "hello", color: Colors.green, id: "askduhsiduh")
              return TodoListItem(
                id: _pinnedTodos[index].id,
                todos: _pinnedTodos[index].listItems,
                listName: _pinnedTodos[index].listName,
                color: _pinnedTodos[index].listColor,
              );
            },
            itemCount: _pinnedTodos.length,
            itemWidth: 700,
            itemHeight: 300,
            // viewportFraction: 0.95,
            loop: false,
          ),
        ),
      ],
    );
  }
}
