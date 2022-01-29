// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Widgets/InputFields.dart';
import 'package:myoffice/Widgets/SubmitButton.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
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
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xff6b59ff),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Expanded(
              child: Container(
                  color: const Color(0xff6b59ff),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xffFCFAFE),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35))),
                    child: ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 5,
                              left: 14),
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
                            leabel: "Id",
                            controller: id),
                        Input(
                          hintText: "Password",
                          leabel: "Password",
                          password: true,
                          controller: password,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          child: SubmitButton(
                              name: "login",
                              action: () {
                                print(id.text);
                                print(password.text);
                                Navigator.pushNamed(context, '/home');
                              },
                              color: Color(0xff767EED)),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
