import 'package:flutter/material.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:provider/provider.dart';
import '../Services/CurrentUser.dart';
import '../Widgets/AppbarButtion.dart';
import '../Widgets/ErrorMsg.dart';

import '../Widgets/LoadingAnimator.dart';

class MyLeave extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyLeave();
  }
}

class _MyLeave extends State<MyLeave> {
  final Widget approved = const Icon(
    Icons.approval_rounded,
    color: Colors.greenAccent,
  );
  final Widget rejected = const Icon(
    Icons.error_outline_rounded,
    color: Colors.redAccent,
  );

  Networking networking = Networking();
  @override
  Widget build(BuildContext context) {
    final userid =
        Provider.of<CurrentUser>(context, listen: false).c_user.userid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'All Leaves',
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
            future: networking.getMyLeaves(userid),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return snapshot.data != []
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: snapshot.data[index].status == 1
                                ? Color(0xffF6F9F8)
                                : Color(0xffF2F4FC),
                            child: Column(children: [
                              ListTile(
                                leading: snapshot.data[index].status == 1
                                    ? approved
                                    : rejected,
                                title: Text('Applied Date :' +
                                    snapshot.data[index].appliedDate),
                                subtitle: Text('Requested date:' +
                                    snapshot.data[index].leaveDate),
                              ),
                              ListTile(
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                    Text('Reason: ' +
                                        snapshot.data[index].reason),
                                    snapshot.data[index].status == 1
                                        ? Text('Status: Approved')
                                        : Text("Status: Pending")
                                  ]))
                            ]),
                          );
                        })
                    : Errormsg();
              }
              return LoadingAnimator();
            }),
      ),
    );
  }
}
