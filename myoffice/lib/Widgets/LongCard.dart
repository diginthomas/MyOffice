import 'package:flutter/material.dart';

class LongCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print('5');
      },
      tileColor: Color(0xffAF9BFA),
      title: Text("Notice Board"),
    );
  }
}
