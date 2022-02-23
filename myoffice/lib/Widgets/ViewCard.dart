import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Screens/EmpUpdate.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/EmpCardText.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';
import 'package:myoffice/Services/Models/Users.dart';

class ViewCard extends StatelessWidget {
  User user;
  Networking networking = Networking();
  ViewCard({required this.user});
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
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                Text(
                  user.name,
                  style: GoogleFonts.sourceCodePro(
                      color: Color(0xff2D1D6B),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 14),
                ),
                Text(
                  user.postion,
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
                        value: user.joineddate,
                      ),
                      EmpCardText(
                        title: 'Salary',
                        value: user.salary.toString(),
                      ),
                      EmpCardText(
                        title: 'Address',
                        value: user.addredss,
                      ),
                      EmpCardText(title: 'Email', value: user.email),
                      EmpCardText(title: 'Phone', value: user.phone),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ActionButton(
                            title: 'Update',
                            action: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EmpUpdate(
                                            user: user,
                                          )));
                            },
                            color: Color(0xff0043A4),
                          ),
                          ActionButton(
                            title: '   Delete   ',
                            action: () {
                              networking.deleteEmp(id: user.id);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      backgroundColor: Colors.redAccent,
                                      content: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Employee Deleted'),
                                      )));
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
