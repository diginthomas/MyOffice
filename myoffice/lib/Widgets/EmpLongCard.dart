import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';

class EmpLongCard extends StatelessWidget {
  final String name;
  final String postion;
  final int id;
  EmpLongCard({required this.id, required this.name, required this.postion});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 12.0),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            color: Color(0xffF7F2FD), borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          ListTile(
            title: Text(
              name,
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            subtitle: Text(
              postion,
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 3,
                  fontSize: 10.0),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: MediaQuery.of(context).size.width / 13.0,
              backgroundImage: const AssetImage('assets/images/elon.jpg'),
            ),
            trailing: ActionButton(
              action: () {
                Navigator.pushNamed(context, '/viewemp');
              },
              color: Color(0xffEE846D),
              title: "View",
            ),
          ),
        ]));
  }
}
