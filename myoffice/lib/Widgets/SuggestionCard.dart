import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myoffice/Services/Networking.dart';
import 'package:myoffice/Widgets/Actionbutton.dart';
import 'package:myoffice/Services/Models/Suggestion.dart';

class SuggestionCard extends StatefulWidget {
  final Suggestion suggestion;
  SuggestionCard({required this.suggestion});
  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  bool vote = false;
  Networking networking = Networking();
  void submit(int id, int value) {
    setState(() {
      vote = true;
      if (value == 1) {
        widget.suggestion.upvote++;
      } else {
        widget.suggestion.downvote++;
      }
    });
    networking.voteSuggestion(id: id, vote: value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF7F2FD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            subtitle: Text(
              widget.suggestion.date,
              style: GoogleFonts.sourceSansPro(
                  fontWeight: FontWeight.w100, letterSpacing: 4),
            ),
            title: Text(
              widget.suggestion.content,
              style: GoogleFonts.sourceCodePro(
                  fontSize: MediaQuery.of(context).size.width / 22),
            ),
            trailing: ActionButton(
                title: 'Delete',
                action: () {
                  print('delte');
                },
                color: Colors.redAccent),
          ),
          Divider(
            color: Colors.grey,
          ),
          !vote
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          submit(widget.suggestion.id, 1);
                        },
                        icon: Icon(
                          Icons.thumb_up,
                          color: Color(0xff0043A4),
                        )),
                    IconButton(
                        onPressed: () {
                          submit(widget.suggestion.id, 0);
                        },
                        icon: Icon(
                          Icons.thumb_down,
                          color: Colors.redAccent,
                        ))
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.suggestion.upvote.toString(),
                        style: GoogleFonts.sourceCodePro(
                            color: Color(0xff0043A4),
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ),
                      Icon(
                        Icons.thumb_up,
                        color: Color(0xff0043A4),
                        size: 25,
                      ),
                      Text(
                        widget.suggestion.downvote.toString(),
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontStyle: FontStyle.italic),
                      ),
                      Icon(
                        Icons.thumb_down,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
