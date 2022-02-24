import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Users.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/Cards.dart';
import 'package:myoffice/Widgets/LongCard.dart';
import 'package:myoffice/Widgets/Layout.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;
    User user = arguments['user'];
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'Home',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
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
            children: user.role == "admin"
                ? <Widget>[
                    //Admin Widgets Start
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SquareCard(
                          icon: EvaIcons.people,
                          title: " Employees",
                          action: () {
                            Navigator.pushNamed(context, '/allemp');
                          },
                        ),
                        SquareCard(
                          icon: EvaIcons.archive,
                          title: "Leave Requests",
                          action: () {
                            Navigator.pushNamed(context, '/leave');
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 8,
                    ),
                    LongCard(
                        action: () {
                          Navigator.pushNamed(context, '/addemp');
                        },
                        title: "Add Employee",
                        icon: EvaIcons.personAdd,
                        actionicon: EvaIcons.plusCircleOutline),
                    LongCard(
                      action: () {
                        Navigator.pushNamed(context, '/notice');
                      },
                      icon: EvaIcons.layoutOutline,
                      actionicon: EvaIcons.edit2,
                      title: "Notice Board",
                    ),
                    LongCard(
                      action: () {
                        Navigator.pushNamed(context, '/suggestion');
                      },
                      icon: EvaIcons.email,
                      actionicon: EvaIcons.eye,
                      title: "Suggestions",
                    ),
                    LongCard(
                      action: () {
                        print('notice');
                      },
                      icon: EvaIcons.person,
                      actionicon: EvaIcons.settings,
                      title: "Edit Profile",
                    ),
                  ] //Admin Widget end
                : <Widget>[
                    //User widget start
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SquareCard(
                          icon: EvaIcons.person,
                          title: "My Profile",
                          action: () {
                            Navigator.pushNamed(context, '/allemp');
                          },
                        ),
                        SquareCard(
                            icon: EvaIcons.paperPlane,
                            title: "Request Leave",
                            action: () {})
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 8,
                    ),
                    LongCard(
                      action: () {
                        Navigator.pushNamed(context, '/notice');
                      },
                      icon: EvaIcons.inboxOutline,
                      actionicon: EvaIcons.eye,
                      title: "Leave Requests",
                    ),
                    LongCard(
                      action: () {
                        Navigator.pushNamed(context, '/notice');
                      },
                      icon: EvaIcons.layoutOutline,
                      actionicon: EvaIcons.edit2,
                      title: "Notice Board",
                    ),
                    LongCard(
                      action: () {
                        Navigator.pushNamed(context, '/suggestion');
                      },
                      icon: EvaIcons.email,
                      actionicon: EvaIcons.edit,
                      title: "Suggestions",
                    ),
                    LongCard(
                      action: () {
                        print('notice');
                      },
                      icon: EvaIcons.person,
                      actionicon: EvaIcons.settings,
                      title: "Edit Profile",
                    ),
                  ], //user Widget End
          ),
        ));
  }
}
