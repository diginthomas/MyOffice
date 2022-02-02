import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Users.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/ViewCard.dart';

class ViewEmp extends StatefulWidget {
  @override
  _ViewEmp createState() {
    return _ViewEmp();
  }
}

class _ViewEmp extends State<ViewEmp> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    User user = arguments['user'];
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            user.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        actions: [
          AppBarButton(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 18,
          )
        ],
      ),
      body: Layout(
        child: ListView(
          children: [
            ViewCard(
              user: user,
            )
          ],
        ),
      ),
    );
  }
}
