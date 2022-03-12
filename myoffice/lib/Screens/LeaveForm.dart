import 'package:flutter/material.dart';

import '../Widgets/AppbarButtion.dart';

class LeaveForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeaveForm();
  }
}

class _LeaveForm extends State<LeaveForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Leave Form',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          AppBarButton(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 18,
          )
        ],
      ),
    );
  }
}
