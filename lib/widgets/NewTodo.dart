import 'package:flutter/material.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({Key? key}) : super(key: key);

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Todo Name", style: TextStyle(fontWeight: FontWeight.bold)),
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.green,
              focusColor: Colors.grey,
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
