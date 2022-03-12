import 'package:flutter/material.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';
import 'package:myoffice/Widgets/InputFields.dart';
import 'package:myoffice/Widgets/Layout.dart';
import '../Widgets/AppbarButtion.dart';

class EditProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EditProfile();
  }
}

class _EditProfile extends State<EditProfile> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Edit Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        actions: [
          AppBarButton(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 18,
          )
        ],
      ),
      body: Layout(
          child: ListView(
        children: [
          Input(
              hintText: "Password",
              label: 'Password',
              controller: passwordController,
              password: true,
              charSize: 14),
          Input(
            hintText: "password password",
            label: 'Confirm ',
            controller: passwordConfirmController,
            charSize: 24,
            password: true,
          ),
          ActionButton(
              title: 'Update',
              action: () {
                if (passwordController.text != passwordController.text ||
                    passwordConfirmController.text == '' ||
                    passwordController.text == '') {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                      content: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('please enter valid data'),
                      )));
                } else {}
              },
              color: Color(0xff0043A4))
        ],
      )),
    );
  }
}
