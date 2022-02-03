import 'package:flutter/material.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/SuggestionCard.dart';

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPage createState() {
    return _SuggestionPage();
  }
}

class _SuggestionPage extends State<SuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            'Suggestion Box',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xff6b59ff),
        elevation: 0.0,
        actions: [
          AppBarButton(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 18,
          )
        ],
      ),
      body: Layout(
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) => SuggestionCard()),
      ),
    );
  }
}
