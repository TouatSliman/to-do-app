// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/dialog_box.dart';
import 'package:flutter_application_1/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  List todoList = [];

  void changeCheckBox(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: _NewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void _NewTask() {
    setState(() {
      todoList.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "TO DO",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskName: todoList[index][0],
              isCompleted: todoList[index][1],
              onChanged: (value) => changeCheckBox(value, index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Center(
            child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24,
        )),
        backgroundColor: Colors.deepPurple,
        onPressed: createNewTask,
      ),
    );
  }
}
