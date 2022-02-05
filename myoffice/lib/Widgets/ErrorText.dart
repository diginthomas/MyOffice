import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorText extends StatelessWidget {
   String error;
  ErrorText({required this.error});
  @override
  Widget build(BuildContext context) {
    return Text(error,
        style: GoogleFonts.zenKurenaido(color: Colors.redAccent));
  }
}
