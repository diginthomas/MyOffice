import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Leave.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/ErrorMsg.dart';
import 'package:myoffice/Widgets/ErrorText.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/LeaveRequestCard.dart';
import 'package:myoffice/Widgets/LoadingAnimator.dart';

class LeaveRequests extends StatefulWidget {
  @override
  State<LeaveRequests> createState() => _LeaveRequestsState();
}

class _LeaveRequestsState extends State<LeaveRequests> {
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
                if (snapshot.data != null) {
                  return snapshot.data != []
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return LeaveRequestCard(
                              leave: snapshot.data[index],
                              approve: () {
                                networking.setStatusForLeave(
                                    id: snapshot.data[index].id, status: 1);
                                setState(() {
                                  snapshot.data.removeAt(index);
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Color(0xff6b59ff),
                                        content: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Leave Approved'),
                                        )));
                              },
                              reject: () {
                                networking.setStatusForLeave(
                                    id: snapshot.data[index].id, status: 2);
                                setState(() {
                                  snapshot.data.removeAt(index);
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.redAccent,
                                        content: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Leave Rejected'),
                                        )));
                              },
                            );
                          })
                      : Errormsg();
                }
                return LoadingAnimator();
              }),
        ));
  }
}
