import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';

final TextStyle style = GoogleFonts.sourceCodePro(
  color: Color(0xff2D1D6B),
);

class LeaveRequestCard extends StatelessWidget {
  final String name;
  final String postion;
  final String appliedDate;
  final String leaveDate;
  final int noLeaves;
  final String reason;
  LeaveRequestCard(
      {Key? key,
      required this.name,
      required this.postion,
      required this.appliedDate,
      required this.leaveDate,
      required this.noLeaves,
      required this.reason})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 9.0),
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.width / 1.8,
      decoration: BoxDecoration(
          color: Color(0xffF7F2FD), borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            title: Text(
              name,
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              postion,
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
          ),
          Container(
            height: MediaQuery.of(context).size.width / 2.9,
            width: MediaQuery.of(context).size.width / 1,
            decoration: BoxDecoration(
                color: Color(0xffF2F1F0),
                borderRadius: BorderRadius.circular(14)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(children: [
                      Text(
                        'Applied Date',
                        style: style,
                      ),
                      Text(
                        appliedDate,
                        style: style,
                      ),
                    ]),
                    Column(children: [
                      Text(
                        'Leave Date',
                        style: style,
                      ),
                      Text(
                        leaveDate,
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    Column(children: [
                      Text(
                        'No.Leave',
                        style: style,
                      ),
                      Text(
                        noLeaves.toString(),
                        style: style,
                      ),
                    ]),
                  ],
                ),
                Divider(
                  height: 14,
                  color: Color(0xffACACAC),
                ),
                Text(
                  'Reason:' + reason,
                  style: style,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      title: 'Approve',
                      action: () {
                        print('ok');
                      },
                      color: Color(0xff0043A4),
                    ),
                    ActionButton(
                      title: '   Reject   ',
                      action: () {
                        print('reject');
                      },
                      color: Colors.redAccent,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
