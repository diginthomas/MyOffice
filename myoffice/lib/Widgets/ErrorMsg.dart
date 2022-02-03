import 'package:flutter/material.dart';

class Errormsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child: Image(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/errormsg.jpg")),
    );
  }
}
