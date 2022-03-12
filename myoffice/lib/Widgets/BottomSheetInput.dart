import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Notice.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';
import 'package:myoffice/Widgets/InputFields.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BottomSheetInput extends StatefulWidget {
  @override
  State<BottomSheetInput> createState() => _BottomSheetInputState();
}

class _BottomSheetInputState extends State<BottomSheetInput> {
  TextEditingController controller = TextEditingController();

  Networking network = Networking();
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView(
        children: [
          Input(
            hintText: "Notice",
            label: "Notice",
            controller: controller,
            autofocus: true,
            charSize: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 18.0, right: 18.0),
            child: status
                ? ActionButton(
                    title: "Submit",
                    action: () async {
                      setState(() {
                        status = false;
                      });
                      if (controller.text == '') {
                        setState(() {
                          status = true;
                        });
                      } else {
                        bool result = await network.addNotice(Notice(
                            id: 1,
                            content: controller.text,
                            date: DateTime.now().toString().substring(0, 10)));
                        Navigator.pop(context);
                      }
                    },
                    color: const Color(0xff0043A4))
                : Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      color: const Color(0xff6b59ff),
                      size: MediaQuery.of(context).size.width / 8,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
