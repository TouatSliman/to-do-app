import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Container(
        padding: EdgeInsets.only(top: 3),
        height: 170,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                "New Task",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: "add new task ..",
                  border: OutlineInputBorder(),
                  focusColor: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Button(
                  value: 'Cancel',
                  onPressed: onCancel,
                ),
                Button(value: 'Save', onPressed: onSave),
              ],
            )
          ],
        ),
      ),
    );
  }
}
