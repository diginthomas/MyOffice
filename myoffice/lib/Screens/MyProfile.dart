import 'package:flutter/material.dart';
import 'package:myoffice/Services/CurrentUser.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/ViewCard.dart';
import 'package:provider/provider.dart';

import '../Widgets/AppbarButtion.dart';

class MyProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyProfile();
  }
}

class _MyProfile extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        title: Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Hello ' + Provider.of<CurrentUser>(context).c_user.name,
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
      body: Layout(
          child: ListView(
        children: [ViewCard(user: Provider.of<CurrentUser>(context).c_user)],
      )),
    );
  }
}
