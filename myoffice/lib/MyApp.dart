import 'package:flutter/material.dart';
import 'package:myoffice/Screens/AddEmp.dart';
import 'package:myoffice/Screens/EditProfile.dart';
import 'package:myoffice/Screens/LeaveForm.dart';
import 'package:myoffice/Screens/LeaveRequests.dart';
import 'package:myoffice/Screens/MyProfile.dart';
import 'package:myoffice/Screens/Notice_Board.dart';
import 'package:myoffice/Screens/login.dart';
import 'package:myoffice/Screens/Home.dart';
import 'package:myoffice/Screens/AllEmp.dart';
import 'package:myoffice/Screens/ViewEmp.dart';
import 'package:myoffice/Screens/SuggestionPage.dart';
import 'package:myoffice/Services/CurrentUser.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
        '/leave': (context) => LeaveRequests(),
        '/allemp': (context) => AllEmp(),
        '/viewemp': (context) => ViewEmp(),
        '/suggestion': (context) => SuggestionPage(),
        '/notice': (context) => NoticeBoard(),
        '/addemp': (context) => AddEmp(),
        '/myprofile': (context) => MyProfile(),
        '/editprofile': (context) => EditProfile(),
        '/leaveform':(context)=>LeaveForm()
      }),
    );
  }
}
