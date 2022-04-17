import "package:flutter/material.dart";

class Todo extends StatelessWidget {
  final String todoText;
  const Todo({required this.todoText, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todoText , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30))
        ],
      ),
    );
  }
}
