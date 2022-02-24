import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  bool autofocus, password;
  final int charSize;
  TextInputType keybordtype;
  Input(
      {required this.hintText,
      required this.label,
      required this.controller,
      this.password = false,
      this.autofocus = false,
      this.keybordtype=TextInputType.text,
      required this.charSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        onSubmitted: (value) {
          controller.text = value;
        },
        autofocus: autofocus ? true : false,
        controller: controller,
        obscureText: password ? true : false,
        keyboardType: keybordtype,
        cursorColor: const Color(0xffB2ABFF),
        decoration: InputDecoration(
            label: Text(
              label,
              style: GoogleFonts.sourceCodePro(),
            ),
            hintText: hintText,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
