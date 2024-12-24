// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChanged;

  TodoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Checkbox(value: isCompleted, onChanged: onChanged),
            Text(
              taskName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
