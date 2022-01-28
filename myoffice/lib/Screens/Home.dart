import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff6b59ff),
          elevation: 0.0,
          actions: [
            
          ],
        ),
        body: SafeArea(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xff6b59ff),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 18,
                      ),
                      Expanded(
                        child: Container(
                          color: const Color(0xff6b59ff),
                          child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffF3E7E7),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35),
                                      topRight: Radius.circular(35))),
                              child: Text('hello')),
                        ),
                      )
                    ]))));
  }
}
