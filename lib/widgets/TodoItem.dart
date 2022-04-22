import "package:flutter/material.dart";
import 'package:vibration/vibration.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatefulWidget {
  final String todoText;
  final String groupId;
  const TodoItem({required this.todoText, required this.groupId, Key? key})
      : super(key: key);

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
  }

  void doNothing(BuildContext context) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Slidable(
        groupTag: widget.groupId,
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            CustomSlidableAction(
                onPressed: doNothing,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(Icons.delete),
                ))
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              checkColor: Colors.white,
              shape: const CircleBorder(),
              activeColor: Colors.blue,
              value: isChecked,
              hoverColor: Colors.indigo,
              onChanged: (value) {
                setState(() {
                  isChecked = value as bool;
                  Vibration.vibrate(amplitude: 30, duration: 50);
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
      ),
    );
  }
}

void doNothing(BuildContext context) {}
