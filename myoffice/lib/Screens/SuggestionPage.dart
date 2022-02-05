import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Suggestion.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/ErrorMsg.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/LoadingAnimator.dart';
import 'package:myoffice/Widgets/SuggestionCard.dart';

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPage createState() {
    return _SuggestionPage();
  }
}

class _SuggestionPage extends State<SuggestionPage> {
  Networking networking = Networking();
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
        child: FutureBuilder(
            future: networking.getSuggestion(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return snapshot.data != []
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) =>
                            SuggestionCard(
                                suggestion: Suggestion(
                                    content: snapshot.data[index].content,
                                    id: snapshot.data[index].id,
                                    date: snapshot.data[index].date,
                                    upvote: snapshot.data[index].upvote,
                                    downvote: snapshot.data[index].downvote)))
                    : Errormsg();
              }
              return LoadingAnimator();
            }),
      ),
    );
  }
}
