import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import "./TodoList.dart";

class PinnedTodos extends StatefulWidget {
  final List pinnedTodoLists;
  const PinnedTodos({Key? key, required this.pinnedTodoLists})
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
              Text("${pageIndex + 1} / ${widget.pinnedTodoLists.length}"),
            ],
          ),
        ),
        SizedBox(
          height: 350,
          width: 800,
          child: Swiper(
            onIndexChanged: onSwiperSwipped,
            itemBuilder: (BuildContext context, int index) {
              return TodoList(
                todos: widget.pinnedTodoLists[index]["listItems"] as List,
                listName: widget.pinnedTodoLists[index]["listName"] as String,
                color: widget.pinnedTodoLists[index]["color"] as Color,
              );
            },
            itemCount: widget.pinnedTodoLists.length,
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
