import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Users.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/LoadingAnimator.dart';
import '../Widgets/Layout.dart';
import 'package:myoffice/Widgets/InputFields.dart';
import 'package:myoffice/Widgets/AppbarActionbutton.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AddEmp extends StatefulWidget {
  @override
  _AddEmp createState() {
    return _AddEmp();
  }
}

class _AddEmp extends State<AddEmp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController empidController = TextEditingController();
  TextEditingController positionCtroller = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController joineddateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool sending = false;
  Networking networking = Networking();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              sending ? 'Sending data....' : 'Add Employee',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        actions: [
          sending
              ? LoadingAnimationWidget.inkDrop(color: Colors.white, size: 35)
              : AppbarActionButton(
                  action: () async {
                    setState(() {
                      sending = true;
                    });
                    bool result = await networking.addEmployee(
                        user: User(
                            id: 1,
                            name: nameController.text,
                            email: emailController.text,
                            role: 'emp',
                            userid: empidController.text,
                            postion: positionCtroller.text,
                            joineddate: joineddateController.text,
                            addredss: addressController.text,
                            qualification: qualificationController.text,
                            salary: int.parse(salaryController.text),
                            phone: phoneController.text,
                        password: passwordController.text));

                    if (result) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Color(0xff6b59ff),
                          content: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Data Sucessfully added'),
                          )));
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.redAccent,
                          content: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Something went wrong'),
                          )));
                      setState(() {
                        sending = false;
                      });
                    }
                  },
                  icon: Icons.save),
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
                leabel: 'Name',
                controller: nameController,
                charSize: 20),
            Input(
                hintText: "Eg:INF/1014",
                leabel: "Employee Id",
                controller: empidController,
                charSize: 14),
            Input(
                hintText: 'Postion',
                leabel: 'Postion',
                controller: positionCtroller,
                charSize: 14),
            Input(
                hintText: 'Salary',
                leabel: 'Salary',
                controller: salaryController,
                keybordtype: TextInputType.number,
                charSize: 14),
            Input(
                hintText: 'Email;',
                leabel: 'Email',
                controller: emailController,
                keybordtype: TextInputType.emailAddress,
                charSize: 14),
            Input(
                hintText: 'Phone',
                leabel: 'Phone',
                controller: phoneController,
                keybordtype: TextInputType.number,
                charSize: 14),
            Input(
                hintText: 'Address',
                leabel: "Address",
                controller: addressController,
                charSize: 14),
            Input(
                hintText: 'Qualification',
                leabel: 'Qualification',
                controller: qualificationController,
                charSize: 14),
            Input(
                hintText: 'DD/MM/YYY',
                leabel: 'Joined Date',
                controller: joineddateController,
                keybordtype: TextInputType.datetime,
                charSize: 14),
            Input(
                hintText: 'Temp Password',
                leabel: 'Password',
                controller: passwordController,
                charSize: 14)
          ],
        ),
      ),
    );
  }
}
