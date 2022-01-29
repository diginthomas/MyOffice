import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/Cards.dart';
import 'package:myoffice/Widgets/LongCard.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6b59ff),
          elevation: 0.0,
          actions: [
            AppBarButton(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 18,
            )
          ],
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff6b59ff),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 18,
                  ),
                  Expanded(
                    child: Container(
                      color: const Color(0xff6b59ff),
                      child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffFCFAFE),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35))),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SquareCard(
                                      icon: EvaIcons.people,
                                      title: " Employees",
                                      action: () {
                                        print('emp');
                                      },
                                    ),
                                    SquareCard(
                                      icon: EvaIcons.archive,
                                      title: "Leave Requests",
                                      action: () {
                                        print('leaves');
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 8,
                                ),
                                LongCard(
                                    action: () {
                                      print('add');
                                    },
                                    title: "Add Employee",
                                    icon: EvaIcons.personAdd,
                                    actionicon: EvaIcons.plusCircleOutline),
                                LongCard(
                                  action: () {
                                    print('notice');
                                  },
                                  icon: EvaIcons.layoutOutline,
                                  actionicon: EvaIcons.edit2,
                                  title: "Notice Board",
                                ),
                                LongCard(
                                  action: () {
                                    print('suggestions');
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
                              ],
                            ),
                          )),
                    ),
                  )
                ])));
  }
}