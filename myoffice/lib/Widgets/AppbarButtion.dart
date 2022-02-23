import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class AppBarButton extends StatelessWidget {
  bool notification = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.width / 35),
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: notification ? Color(0xffD0AAF3) : Color(0xffDADFE3)),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(
            notification ? Icons.home : Icons.home,
            color: Color(0xff6b59ff),
            size: 30,
          ),
        ));
  }
}
