import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Widgets/EmpCardText.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';

class ViewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 0.5,
      height: MediaQuery.of(context).size.height / 1.25,
      decoration: BoxDecoration(
          color: Color(0xffF2F1F0), borderRadius: BorderRadius.circular(28.0)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(children: [
                CircleAvatar(
                  backgroundColor: Color(0xffF2F1F0),
                  radius: MediaQuery.of(context).size.width / 8,
                  backgroundImage: AssetImage('assets/images/elon.jpg'),
                ),
                Text(
                  'Digin Thomas',
                  style: GoogleFonts.sourceCodePro(
                      color: Color(0xff2D1D6B),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 14),
                ),
                Text(
                  'Developer',
                  style: GoogleFonts.sourceCodePro(
                      color: Color(0xff2D1D6B),
                      fontWeight: FontWeight.w400,
                      letterSpacing: 4,
                      fontSize: MediaQuery.of(context).size.width / 24),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffF1EFF9),
                      borderRadius: BorderRadius.circular(14)),
                  child: Column(
                    children: [
                      EmpCardText(
                        title: "Joined Date",
                        value: '10/02/2020',
                      ),
                      EmpCardText(
                        title: 'Salary',
                        value: '14000',
                      ),
                      EmpCardText(
                        title: 'Address',
                        value: 'some address',
                      ),
                      EmpCardText(title: 'Email', value: 'email@gmail.com'),
                      EmpCardText(title: 'Phone', value: '9874455415'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActionButton(
                            title: 'Update',
                            action: () {
                              print('ok');
                            },
                            color: Color(0xff0043A4),
                          ),
                          ActionButton(
                            title: '   Delete   ',
                            action: () {
                              print('Delete');
                            },
                            color: Colors.redAccent,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
