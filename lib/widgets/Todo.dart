import "package:flutter/material.dart";
import 'package:vibration/vibration.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todo extends StatefulWidget {
  final String todoText;
  const Todo({required this.todoText, Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
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
          // Slidable(
          //   // Specify a key if the Slidable is dismissible.
          //   key: const ValueKey(0),

          //   // The end action pane is the one at the right or the bottom side.
          //   endActionPane: ActionPane(
          //     motion: ScrollMotion(),
          //     children: [
          //       SlidableAction(
          //         // An action can be bigger than the others.
          //         flex: 2,
          //         onPressed: doNothing,
          //         backgroundColor: Color(0xFF7BC043),
          //         foregroundColor: Colors.white,
          //         icon: Icons.archive,
          //         label: 'Archive',
          //       ),
          //     ],
          //   ),

          //   // The child of the Slidable is what the user sees when the
          //   // component is not dragged.
          //   child: const ListTile(title: Text('Slide me')),
          // ),
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
    );
  }
}

void doNothing(BuildContext context) {}
