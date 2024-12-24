import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String value;
  VoidCallback onPressed;
  Button({super.key, required this.value, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
