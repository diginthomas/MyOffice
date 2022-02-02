import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String email;
  String role;
  String userid;
  String postion;
  String joineddate;
  String addredss;
  String qualification;
  String phone;
  int salary;
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.role,
      required this.userid,
      required this.postion,
      required this.joineddate,
      required this.addredss,
      required this.qualification,
      required this.salary,
      required this.phone});
}
