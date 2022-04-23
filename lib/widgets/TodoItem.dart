import "package:flutter/material.dart";
import 'package:vibration/vibration.dart';
import 'package:provider/provider.dart';
import "../providers/TodoProvider.dart";

class TodoItem extends StatefulWidget {
  final String todoText;
  final bool isChecked;
  final String listId;
  final String id;
  const TodoItem(
      {required this.todoText,
      required this.isChecked,
      required this.id,
      required this.listId,
      Key? key})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isChecked = widget.isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    todoProvider.setIsChecked(widget.listId, widget.id, isChecked);

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            checkColor: Colors.white,
            // shape: const CircleBorder(),
            activeColor: Colors.blue,
            value: isChecked,
            hoverColor: Colors.indigo,
            onChanged: (value) {
              Vibration.vibrate(amplitude: 30, duration: 50);
              setState(() {
                isChecked = value as bool;
              });
            },
          ),
          Expanded(
            child: Text(
              widget.todoText,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
        ],
      ),
      // child: Slidable(
      //   groupTag: widget.groupId,
      //   endActionPane: ActionPane(
      //     motion: StretchMotion(),
      //     children: [
      //       CustomSlidableAction(
      //           onPressed: doNothing,
      //           child: Container(
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(30),
      //             ),
      //             child: Icon(Icons.delete),
      //           ))
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Checkbox(
      //         checkColor: Colors.white,
      //         shape: const CircleBorder(),
      //         activeColor: Colors.blue,
      //         value: isChecked,
      //         hoverColor: Colors.indigo,
      //         onChanged: (value) {
      //           setState(() {
      //             isChecked = value as bool;
      //             Vibration.vibrate(amplitude: 30, duration: 50);
      //           });
      //         },
      //       ),
      //       Expanded(
      //         child: Text(
      //           widget.todoText,
      //           maxLines: 1,
      //           overflow: TextOverflow.ellipsis,
      //           style: const TextStyle(color: Colors.black, fontSize: 15),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

void doNothing(BuildContext context) {}
