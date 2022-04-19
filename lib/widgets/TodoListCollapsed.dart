import 'package:flutter/material.dart';
import "../helpers/ColorUtils.dart";

class TodoListCollapsed extends StatelessWidget {
  const TodoListCollapsed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.0, color: darken(Colors.grey[50] as Color)),
        color: Colors.grey[50],
      ),
      width: double.infinity,
      child: const Text("2022 Goals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
    );
  }
}
