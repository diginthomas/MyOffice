import 'package:flutter/material.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';
import 'package:myoffice/Widgets/InputFields.dart';

class BottomSheetInput extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView(
        children: [
          Input(
            hintText: "Notice",
            leabel: "Notice",
            controller: controller,
            autofocus: true,
            charSize: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 18.0, right: 18.0),
            child: ActionButton(
                title: "Submit",
                action: () {
                  print(controller.text);
                  Navigator.pop(context);
                },
                color: Color(0xff0043A4)),
          )
        ],
      ),
    );
  }
}
