import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Leave.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/LeaveRequestCard.dart';
import 'package:myoffice/Widgets/LoadingAnimator.dart';

class LeaveRequests extends StatelessWidget {
  Networking networking = Networking();

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
          child: FutureBuilder(
              future: networking.getAllLeaves(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LeaveRequestCard(leave: snapshot.data[index]);
                      });
                }
                return LoadingAnimator();
              }),
        ));
  }
}
