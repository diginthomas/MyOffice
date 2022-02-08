import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myoffice/Services/Models/Users.dart';
import 'dart:convert';
import 'package:myoffice/Services/Models/Notice.dart';
import 'package:myoffice/Services/Models/Suggestion.dart';

class Networking extends ChangeNotifier {
  final String url = 'https://myofficerest.herokuapp.com/office';
  // late final String response;

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
    if (response.statusCode == 200) {
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
    }
    return user;
  }

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

  Future<bool> addNotice(Notice notice) async {
    var response = await http.post(Uri.parse(url + '/notice/add'),
        body: {'content': notice.content, 'date': notice.date});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteNotice(int id) async {
    var response = await http.delete(Uri.parse(url + '/notice/$id'));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<List<Suggestion>> getSuggestion() async {
    List<Suggestion> suggestion = [];
    var response = await http.get(Uri.parse(url + '/suggestion/get'));
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

  Future<bool> voteSuggestion({required int id, required int vote}) async {
    var response = await http.patch(Uri.parse(url + '/suggestion/update'),
        body: {'id': id.toString(), 'vote': vote.toString()});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> addEmployee(
      {required User user, required String password}) async {
    final response = await http.post(Uri.parse(url + '/admin/create'), body: {
      'name': user.name,
      'userid': user.userid.toString(),
      'address': user.addredss,
      'mobile': user.phone,
      'email': user.email,
      'password': password,
      'joiningdate': user.joineddate,
      'qualification': user.qualification,
      'jobposition': user.postion,
      'salary': user.salary.toString()
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
