import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final void Function() action;
  final Color color;
  ActionButton(
      {Key? key, required this.title, required this.action, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed:action,
      color:color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    );
  }
}
