import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Leave.dart';
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
              leave: Leave(
                  id: 1,
                  leaveDate: '2020/04/20',
                  appliedDate: '2020/04/15',
                  name: "Digin Thomas",
                  postion: 'Php',
                  reason: "Personal",
                  status: 0,
                  noLeave: 4),
            ),
          ),
        ));
  }
}
