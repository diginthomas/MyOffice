import 'package:flutter/material.dart';
import 'package:myoffice/Widgets/AppbarActionbutton.dart';
import 'package:myoffice/Widgets/BottomSheetInput.dart';
import 'package:myoffice/Widgets/ErrorMsg.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/LoadingAnimator.dart';
import 'package:myoffice/Widgets/NoticeMessage.dart';
import 'package:myoffice/Services/Models/Notice.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:myoffice/Services/Networking.dart';

class NoticeBoard extends StatefulWidget {
  @override
  _NoticeBoard createState() {
    return _NoticeBoard();
  }
}

class _NoticeBoard extends State<NoticeBoard> {
  Networking networking = Networking();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Notice Board',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        actions: [
          AppbarActionButton(
            icon: EvaIcons.fileAdd,
            action: () {
              showModalBottomSheet(
                  backgroundColor: Color(0xffF6EAFF),
                  context: context,
                  builder: (BuildContext contet) => BottomSheetInput());
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 18,
          )
        ],
      ),
      body: Layout(
          child: FutureBuilder(
              future: networking.getNotice(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data != []
                      ? ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) => NoticeMessage(
                            notice: snapshot.data[index],
                            action: () {
                              setState(() {
                                networking
                                    .deleteNotice(snapshot.data[index].id);
                              });
                            },
                          ),
                        )
                      : Errormsg();
                }
                return LoadingAnimator();
              })),
    );
  }
}
