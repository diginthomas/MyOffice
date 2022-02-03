import 'package:flutter/material.dart';


class AppbarActionButton extends StatelessWidget {
  final IconData icon;
  final void Function() action;
  AppbarActionButton({required this.action, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 35),
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Color(0xffDADFE3)),
        child: IconButton(
          onPressed: action,
          icon: Icon(
           icon,
            color: Color(0xff6b59ff),
            size: 30,
          ),
        ));
  }
}
