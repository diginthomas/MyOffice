import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SquareCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function() action;
  SquareCard({required this.icon, required this.title, required this.action});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffF7F2FD), borderRadius: BorderRadius.circular(14)),
        height: MediaQuery.of(context).size.width / 3,
        width: MediaQuery.of(context).size.width / 2.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Color(0xffAF9BFA),
              size: MediaQuery.of(context).size.width / 9,
            ),
            Text(
              title,
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B), fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
