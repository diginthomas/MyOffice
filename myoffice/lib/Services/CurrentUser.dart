import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Users.dart';

class CurrentUser extends ChangeNotifier {
  User c_user = User(
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
  void setUser(User user) {
    c_user = user;
    notifyListeners();
  }

  void deleteUser() {
    c_user = User(
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
    notifyListeners();
  }
}
