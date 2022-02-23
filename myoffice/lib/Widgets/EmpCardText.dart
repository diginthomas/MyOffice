import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final TextStyle style = GoogleFonts.sourceCodePro(fontSize: 12.0);

class EmpCardText extends StatelessWidget {
  final String title;
  final String value;
  EmpCardText({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title + " :",
            style: style,
          ),
          Text(
            value,
            style: style,
          )
        ],
      ),
    );
  }
}
