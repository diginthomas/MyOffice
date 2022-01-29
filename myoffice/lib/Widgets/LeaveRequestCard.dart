import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeaveRequestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 9.0),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 1.8,
      decoration: BoxDecoration(
          color: Color(0xffF7F2FD), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Elon Musk',
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Developer",
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 3),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: MediaQuery.of(context).size.width / 13.0,
              backgroundImage: AssetImage('assets/images/elon.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
