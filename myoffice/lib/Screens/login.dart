import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Widgets/InputFields.dart';
import 'package:myoffice/Widgets/SubmitButton.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:provider/provider.dart';

import '../Services/CurrentUser.dart';
import '../Services/Models/Users.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  bool status = true;
  bool idrror = true;
  bool psserror = true;
  final TextEditingController id = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6b59ff),
        elevation: 1,
        title: const Text(
          'Login',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Layout(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width / 5, left: 14),
              child: Text(
                "Welcome User...",
                style: GoogleFonts.kleeOne(
                    textStyle: const TextStyle(
                        color: Color(0xff2D1D6B),
                        letterSpacing: 5,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Input(
              hintText: "employee id",
              label: "Id",
              controller: id,
              charSize: 10,
            ),
            Input(
              hintText: "Password",
              label: "Password",
              password: true,
              controller: password,
              charSize: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 14, right: 14),
                child: SubmitButton(
                    name: status ? "login" : "Loading...",
                    action: () async {
                      setState(() {
                        status = !status;
                      });
                      Networking networking = Networking();

                      if (id.text == '' || password.text == '') {
                        setState(() {
                          idrror = true;
                          status = !status;
                        });
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Colors.redAccent,
                                content: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Please enter valid values'),
                                )));
                      } else {
                        Networking networking = Networking();
                        User user =
                            await networking.authUser(id.text, password.text);
                         
                        if (user.name != 'Wrong') {
                          Provider.of<CurrentUser>(context,listen: false).setUser(user);
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  content: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Wrong password or id'),
                                  )));
                          setState(() {
                            idrror = true;
                            status = !status;
                          });
                        }
                      }
                    },
                    color: Color(0xff767EED)))
          ],
        ),
      )),
    );
  }
}
