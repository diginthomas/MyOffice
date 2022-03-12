import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myoffice/Services/Models/Users.dart';
import 'dart:convert';
import 'package:myoffice/Services/Models/Notice.dart';
import 'package:myoffice/Services/Models/Suggestion.dart';
import 'Models/Leave.dart';

final User tempUser = User(
    id: 1,
    name: "Wrong",
    email: "",
    password: "",
    salary: 4,
    role: "",
    addredss: "",
    qualification: "",
    userid: "",
    phone: "",
    postion: "",
    joineddate: "");

class Networking {
 
  final String url = 'https://myofficerest.herokuapp.com/office';
//Login system
  Future authUser(String userid, String password) async {
    var response = await http.post(Uri.parse(url + '/user/login'),
        body: {'userid': userid, 'password': password});
    if (response.statusCode == 200) {
      var data = response.body;

      if (data.isNotEmpty) {
        var cu = jsonDecode(data);
        User user = User(
            id: cu['id'],
            name: cu['name'],
            email: cu['email'],
            password: cu['password'],
            role: cu['role'],
            userid: cu['userid'],
            postion: cu['jobposition'],
            qualification: cu['qualification'],
            salary: cu['salary'],
            joineddate: cu['joiningdate'],
            addredss: cu['address'],
            phone: cu['mobile'].toString());
           return user;
      } else {
        //passing dummy user
        return tempUser;
      }
    }
     return tempUser;
  }

//Fetch all user from Server
  Future<List<User>> getAllUser() async {
    var response = await http.get(Uri.parse(url + '/user/getall/empl'));
    List<User> user = [];
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (int index = 0; index < data.length; index++) {
        User userdata = User(
            id: data[index]['id'],
            name: data[index]['name'],
            email: data[index]['email'],
            password: data[index]['password'],
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
    }
    return user;
  }

  //Add New employye to server
  Future<bool> addEmployee({required User user}) async {
    final response = await http.post(Uri.parse(url + '/admin/create'), body: {
      'name': user.name,
      'userid': user.userid.toString(),
      'address': user.addredss,
      'mobile': user.phone,
      'email': user.email,
      'password': user.password,
      'joiningdate': user.joineddate,
      'qualification': user.qualification,
      'jobposition': user.postion,
      'salary': user.salary.toString()
    });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //delete employee
  Future<bool> deleteEmp({required int id}) async {
    var result = await http.delete(Uri.parse(url + '/user/delete/$id'));
    if (result.statusCode == 200) {
      return false;
    }
    return true;
  }

  //update employee
  Future<bool> updateEmp({required User user}) async {
    var result = await http.put(Uri.parse(url + '/user/update'), body: {
      'id': user.id.toString(),
      'name': user.name,
      'userid': user.userid.toString(),
      'address': user.addredss,
      'mobile': user.phone,
      'password': user.password,
      'email': user.email,
      'joiningdate': user.joineddate,
      'qualification': user.qualification,
      'jobposition': user.postion,
      'salary': user.salary.toString()
    });
    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

  //get all notices from server
  Future<List<Notice>> getNotice() async {
    List<Notice> notice = [];
    var response = await http.get(Uri.parse(url + '/notice/get'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        Notice noticedata = Notice(
            id: data[i]['id'],
            content: data[i]['content'],
            date: data[i]['date']);
        notice.add(noticedata);
      }
      return notice;
    }
    return notice;
  }

  //add new notice to server
  Future<bool> addNotice(Notice notice) async {
    var response = await http.post(Uri.parse(url + '/notice/add'),
        body: {'content': notice.content, 'date': notice.date});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //delete notice from server
  Future<bool> deleteNotice(int id) async {
    var response = await http.delete(Uri.parse(url + '/notice/$id'));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  //get all suggestion from server
  Future<List<Suggestion>> getSuggestion() async {
    List<Suggestion> suggestion = [];
    var response = await http.get(
      Uri.parse(url + '/suggestion/get/1'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for (int i = 0; i < data.length; i++) {
        Suggestion suggestiondata = Suggestion(
            id: data[i]['id'],
            content: data[i]['content'],
            date: data[i]['date'],
            upvote: data[i]['upvote'],
            downvote: data[i]['downvote']);
        suggestion.add(suggestiondata);
      }
      return suggestion;
    }
    return suggestion;
  }

  //record vote
  Future<bool> voteSuggestion({required int id, required int vote}) async {
    var response = await http.patch(Uri.parse(url + '/suggestion/update'),
        body: {'id': id.toString(), 'vote': vote.toString(), 'userid': '1'});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

//fetching leave requests from server
  Future<List<Leave>> getAllLeaves() async {
    List<Leave> leave = [];
    var response = await http.get(Uri.parse(url + '/leave/get/0'));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      // print(data);
      for (int i = 0; i < data.length; i++) {
        Leave leaveData = Leave(
            id: data[i]['leaverequest']['id'],
            name: data[i]['users']['name'],
            userid: data[i]['users']['id'],
            postion: data[i]['users']['jobposition'],
            appliedDate: data[i]['leaverequest']['applieddate'],
            leaveDate: data[i]['leaverequest']['leavedate'],
            leaveCount: data[i]['leaverequest']['leavecount'],
            reason: data[i]['leaverequest']['reason'],
            status: data[i]['leaverequest']['status']);
        leave.add(leaveData);
      }
      return leave; //sending new list with data from server
    } else {
      return leave; //sending empty list
    }
  }

  Future<bool> setStatusForLeave({required int id, required int status}) async {
    var result = await http.put(Uri.parse(url + '/leave/status'),
        body: {'id': id.toString(), 'status': status.toString()});
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
