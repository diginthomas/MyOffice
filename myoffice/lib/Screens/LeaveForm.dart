import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Leave.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/InputFields.dart';
import 'package:myoffice/Widgets/SubmitButton.dart';
import 'package:provider/provider.dart';

import '../Services/CurrentUser.dart';
import '../Widgets/AppbarButtion.dart';
import '../Widgets/Layout.dart';

class LeaveForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeaveForm();
  }
}

class _LeaveForm extends State<LeaveForm> {
  TextEditingController leaveDate = TextEditingController();
  TextEditingController reason = TextEditingController();
  Networking networking = Networking();
  bool status = false;
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<CurrentUser>(context, listen: false).c_user;
    String userid = user.userid;
    String name = user.name;
    String postion = user.postion;
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
      body: Layout(
          child: ListView(
        children: [
          Input(
              hintText: "DD-MM-YYYY",
              label: " Required Date",
              controller: leaveDate,
              charSize: 4),
          Input(
              hintText: "Reason",
              label: "Reason for leave",
              controller: reason,
              charSize: 14),
          SubmitButton(
              name: status ? "sending" : "Apply",
              action: () async {
                setState(() {
                  status = !status;
                });
                if (reason.text == '' ||
                    leaveDate.text == '' ||
                    status == false) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('please enter valid data'),
                      )));
                } else {
                  Leave leave = Leave(
                      id: 0,
                      userid: userid,
                      name: name,
                      postion: postion,
                      appliedDate: DateTime.now().toString().substring(0, 10),
                      leaveDate: leaveDate.text,
                      leaveCount: 0,
                      reason: reason.text,
                      status: 0);

                  var result = await networking.applyLeave(leave);
                 if (result == true) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Color(0xff6b59ff),
                        content: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Leave submited'),
                        )));
                  } 
                 else {
                    setState(() {
                      status = !status;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Something went wrong'),
                        )));
                  
                }     
                }
              },
              color: Colors.blueAccent)
        ],
      )),
    );
  }
}
