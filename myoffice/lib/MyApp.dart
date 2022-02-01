import 'package:flutter/material.dart';
import 'package:myoffice/Screens/LeaveRequests.dart';
import 'package:myoffice/Screens/login.dart';
import 'package:myoffice/Screens/Home.dart';
import 'package:myoffice/Screens/AllEmp.dart';
import 'package:myoffice/Screens/ViewEmp.dart';
import 'package:myoffice/Screens/Suggestions.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/': (context) => Login(),
      '/home': (context) => Home(),
      '/leave': (context) => LeaveRequests(),
      '/allemp': (context) => AllEmp(),
      '/viewemp': (context) => ViewEmp(),
      '/suggestion': (context) => Suggestion()
    });
  }
}
