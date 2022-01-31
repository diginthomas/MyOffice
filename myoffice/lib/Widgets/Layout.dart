import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Widget child;
  Layout({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color(0xff6b59ff),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 18,
          ),
          Expanded(
              child: Container(
                  color: const Color(0xff6b59ff),
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffFCFAFE),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      child: Padding(
                          padding: EdgeInsets.all(14.0), child: child))))
        ]));
  }
}
