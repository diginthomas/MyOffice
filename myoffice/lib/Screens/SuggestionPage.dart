import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myoffice/Services/Models/Suggestion.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/AppbarButtion.dart';
import 'package:myoffice/Widgets/ErrorMsg.dart';
import 'package:myoffice/Widgets/Layout.dart';
import 'package:myoffice/Widgets/LoadingAnimator.dart';
import 'package:myoffice/Widgets/SuggestionCard.dart';
import 'package:myoffice/Widgets/SuggestionSheet.dart';
import 'package:provider/provider.dart';

import '../Services/CurrentUser.dart';
import '../Widgets/AppbarActionbutton.dart';
import '../Widgets/BottomSheetInput.dart';

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
    int id = Provider.of<CurrentUser>(context, listen: false).c_user.id;
    String role = Provider.of<CurrentUser>(context, listen: false).c_user.role;
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
          Provider.of<CurrentUser>(context).c_user.role != 'admin'
              ? AppbarActionButton(
                  icon: EvaIcons.fileAdd,
                  action: () {
                    showModalBottomSheet(
                        backgroundColor: Color(0xffF6EAFF),
                        context: context,
                        builder: (BuildContext context) => SuggestionSheet());
                  },
                )
              : AppBarButton(),
          SizedBox(
            width: MediaQuery.of(context).size.width / 18,
          )
        ],
      ),
      body: Layout(
        child: FutureBuilder(
            future:role=='admin'?networking.getSuggestion(0): networking.getSuggestion(id),
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
