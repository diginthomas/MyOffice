import 'package:flutter/material.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/LeaveRequestCard.dart';

class LeaveRequests extends StatelessWidget {
  List<String> emp = ['digin', 'tom', 'tony', 'cris'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6b59ff),
          elevation: 0.0,
          title: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Employee Leave \nRequests',
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
          child: ListView.builder(
            itemCount: emp.length,
            itemBuilder: (BuildContext context, int index) => LeaveRequestCard(
              name: "Elon Musk",
              postion: "Developer",
              appliedDate: "10-04-2022",
              leaveDate: "12-04-2022",
              noLeaves: 5,
              reason: "Personal",
            ),
          ),
        ));
  }
}
