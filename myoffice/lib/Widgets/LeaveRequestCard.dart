import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';
import 'package:myoffice/Services/Models/Leave.dart';

final TextStyle style = GoogleFonts.sourceCodePro(
  color: Color(0xff2D1D6B),
);

class LeaveRequestCard extends StatelessWidget {
  final Leave leave;
  final VoidCallback approve;
  final VoidCallback reject;
  LeaveRequestCard({required this.leave, required this.approve,required this.reject});
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
              leave.name,
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              leave.postion,
              style: GoogleFonts.sourceCodePro(
                  color: Color(0xff2D1D6B),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 3),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              radius: MediaQuery.of(context).size.width / 13.0,
              backgroundImage: const AssetImage('assets/images/profile.png'),
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
                        leave.appliedDate,
                        style: style,
                      ),
                    ]),
                    Column(children: [
                      Text(
                        'Leave Date',
                        style: style,
                      ),
                      Text(
                        leave.leaveDate,
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
                        leave.leaveCount.toString(),
                        style: style,
                      ),
                    ]),
                  ],
                ),
                const Divider(
                  height: 14.0,
                  color: Color(0xffACACAC),
                ),
                Text(
                  'Reason:' + leave.reason,
                  style: style,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ActionButton(
                      title: 'Approve',
                      action: approve,
                      color: Color(0xff0043A4),
                    ),
                    ActionButton(
                      title: '   Reject   ',
                      action: reject,
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
