import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myoffice/Services/Models/Users.dart';
import 'dart:convert';

class Networking extends ChangeNotifier {
  final String url = 'https://damp-inlet-58988.herokuapp.com/office';
  late final String response;
  Future<String> authUser(String userid, String password) async {
    var response = await http.post(Uri.parse(url + '/user/login'),
        body: {'userid': '$userid', 'password': '$password'});
    if (response.statusCode == 200) {
      String value = response.body;
      return value;
    } else {
      print(response.statusCode);
      return 'connction error';
    }
  }

  Future<List<User>> getAllUser() async {
    var response = await http.get(Uri.parse(url + '/user/getall/empl'));
    List<User> user = [];
    List data = jsonDecode(response.body);
    for (int index = 0; index < data.length; index++) {
      User userdata = User(
          id: data[index]['id'],
          name: data[index]['name'],
          email: data[index]['email'],
          role: data[index]['role'],
          userid: data[index]['userid'],
          postion: data[index]['jobposition'],
          qualification: data[index]['qualification'],
          salary: data[index]['salary'],
          joineddate: data[index]['joiningdate'],
          addredss: data[index]['address'],
          phone: data[index]['mobile'].toString());
      user.add(userdata);
    }

    return user;
  }
}
