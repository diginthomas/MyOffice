import 'package:flutter/material.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/ErrorMsg.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/EmpLongCard.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/LoadingAnimator.dart';

class AllEmp extends StatefulWidget {
  @override
  _AllEmp createState() {
    return _AllEmp();
  }
}

class _AllEmp extends State<AllEmp> {
  Networking service = Networking();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            ' All Employees',
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
          child: FutureBuilder(
              future: service.getAllUser(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return snapshot.data == []
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) =>
                              EmpLongCard(
                                user: snapshot.data[index],
                                name: snapshot.data[index].name,
                                postion: snapshot.data[index].postion,
                              ))
                      : Errormsg();
                }
                return LoadingAnimator();
              })),
    );
  }
}
