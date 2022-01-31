import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';

class EmpLongCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 9.0),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 1.8,
        decoration: BoxDecoration(
            color: Color(0xffF7F2FD), borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            title: Text(
              'digin ',
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'dev',
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 3),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: MediaQuery.of(context).size.width / 13.0,
              backgroundImage: const AssetImage('assets/images/elon.jpg'),
            ),
            trailing: ActionButton(
              action: () {
                print('d');
              },
              color: Color(0xffEE846D),
              title: "View",
            ),
          ),
          Divider(
            height: 14,
            color: Color(0xffACACAC),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(
                title: ' Edit ',
                action: () {
                  print('ok');
                },
                color: Color(0xff0043A4),
              ),
              ActionButton(
                title: ' Delete ',
                action: () {
                  print('reject');
                },
                color: Colors.redAccent,
              )
            ],
          )
        ]));
  }
}
