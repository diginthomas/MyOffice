import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LongCard extends StatelessWidget {
  final void Function() action;
  final String title;
  final IconData icon;
  final IconData actionicon;
  LongCard(
      {Key? key, required this.action,
      required this.title,
      required this.icon,
      required this.actionicon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.width / 6,
        decoration: BoxDecoration(
            color: const Color(0xffF7F2FD),
            borderRadius: BorderRadius.circular(11.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Icon(icon,
                    color: const Color(0xffAF9BFA),
                    size: MediaQuery.of(context).size.width / 10),
                Text(' ' + title,
                    style: GoogleFonts.sourceCodePro(
                        color: Color(0xff2D1D6B), fontStyle: FontStyle.italic))
              ],
            ),
            Icon(actionicon,
                color: const Color(0xffAF9BFA),
                size: MediaQuery.of(context).size.width / 10)
          ],
        ),
      ),
    );
  }
}
