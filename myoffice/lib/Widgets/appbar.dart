import 'package:flutter/material.dart';

import 'AppbarButtion.dart';

class AppBarstyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff6b59ff),
      elevation: 0.0,
      actions: [
        AppBarButton(),
        SizedBox(
          width: MediaQuery.of(context).size.width / 18,
        )
      ],
    );
  }
}
