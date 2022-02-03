import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';
import 'package:myoffice/Services/Models/Notice.dart';

class NoticeMessage extends StatelessWidget {
  final Notice notice;

  NoticeMessage({required this.notice});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
        child: ListTile(
          title: Text(
            notice.content,
            style: GoogleFonts.sourceCodePro(
                fontWeight: FontWeight.bold, color: Color(0xff2D1D6B)),
          ),
          subtitle: Text(
            notice.date.toString(),
            style: GoogleFonts.sourceCodePro(
                color: Color(0xff2D1D6B), fontWeight: FontWeight.w300),
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: ActionButton(
              action: () {
                print('delete');
              },
              color: Colors.redAccent,
              title: 'Delete',
            ),
          ),
        ),
      ),
    );
  }
}
