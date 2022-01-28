import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String name;
  final void Function() action;
  final Color color;
  SubmitButton({required this.name, required this.action, required this.color});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: FlatButton(
        height: MediaQuery.of(context).size.height / 14,
        onPressed: action,
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        color: color,
      ),
    );
  }
}
