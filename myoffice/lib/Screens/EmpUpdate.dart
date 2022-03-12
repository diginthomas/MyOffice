import 'package:flutter/material.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/AppbarActionbutton.dart';
import 'package:myoffice/Widgets/InputFields.dart';
import 'package:myoffice/Widgets/Layout.dart';
import '../Services/Models/Users.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class EmpUpdate extends StatefulWidget {
  final User user;
  EmpUpdate({required this.user});
  @override
  _EmpUpdate createState() {
    return _EmpUpdate();
  }
}

class _EmpUpdate extends State<EmpUpdate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController empidController = TextEditingController();
  TextEditingController positionCtroller = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController joineddateController = TextEditingController();
  Networking networking = Networking();
  @override
  void initState() {
    nameController.text = widget.user.name;
    positionCtroller.text = widget.user.postion;
    salaryController.text = widget.user.salary.toString();
    emailController.text = widget.user.email;
    phoneController.text = widget.user.phone;
    addressController.text = widget.user.addredss;
    qualificationController.text = widget.user.qualification;
    empidController.text = widget.user.userid;
    joineddateController.text = widget.user.joineddate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        title: Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Update ' + widget.user.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          AppbarActionButton(
              action: () {
                if (nameController.text == '' ||
                    emailController.text == '' ||
                    empidController.text == '' ||
                    positionCtroller.text == '' ||
                    salaryController.text == '' ||
                    addressController.text == '' ||
                    qualificationController.text == '' ||
                    joineddateController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Enter valid data'),
                      )));
                } else {
                  networking.updateEmp(
                      user: User(
                          id: widget.user.id,
                          name: nameController.text,
                          email: emailController.text,
                          role: widget.user.role,
                          userid: empidController.text,
                          postion: positionCtroller.text,
                          password: widget.user.password,
                          joineddate: joineddateController.text,
                          addredss: addressController.text,
                          qualification: qualificationController.text,
                          salary: int.parse(salaryController.text),
                          phone: phoneController.text));
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color(0xff6b59ff),
                      content: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Employee Updated'),
                      )));
                }
              },
              icon: EvaIcons.upload),
          SizedBox(
            width: MediaQuery.of(context).size.width / 18,
          )
        ],
      ),
      body: Layout(
          child: ListView(
        children: [
          Input(
              hintText: "Employee Name",
              label: 'Name',
              controller: nameController,
              charSize: 20),
          Input(
              hintText: "Eg:INF/1014",
              label: "Employee Id",
              controller: empidController,
              charSize: 14),
          Input(
              hintText: 'Postion',
              label: 'Postion',
              controller: positionCtroller,
              charSize: 14),
          Input(
              hintText: 'Salary',
              label: 'Salary',
              controller: salaryController,
              keybordtype: TextInputType.number,
              charSize: 14),
          Input(
              hintText: 'Email;',
              label: 'Email',
              controller: emailController,
              keybordtype: TextInputType.emailAddress,
              charSize: 14),
          Input(
              hintText: 'Phone',
              label: 'Phone',
              controller: phoneController,
              keybordtype: TextInputType.number,
              charSize: 14),
          Input(
              hintText: 'Address',
              label: "Address",
              controller: addressController,
              charSize: 14),
          Input(
              hintText: 'Qualification',
              label: 'Qualification',
              controller: qualificationController,
              charSize: 14),
          Input(
              hintText: 'DD/MM/YYY',
              label: 'Joined Date',
              controller: joineddateController,
              keybordtype: TextInputType.datetime,
              charSize: 14)
        ],
      )),
    );
  }
}
