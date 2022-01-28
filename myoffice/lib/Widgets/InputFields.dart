import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String leabel;
  bool password;
  Input({required this.hintText, required this.leabel, required this.controller ,this.password = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        obscureText: password ? true : false,
        keyboardType: TextInputType.text,
        cursorColor: const Color(0xffB2ABFF),
        decoration: InputDecoration(
            label: Text(
              leabel,
              style: GoogleFonts.sourceCodePro(),
            ),
            hintText: hintText,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
