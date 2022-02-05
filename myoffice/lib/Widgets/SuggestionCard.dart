import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  void submit() {
    setState(() {
      vote = true;
    });
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
                        onPressed: submit,
                        icon: Icon(
                          Icons.thumb_up,
                          color: Color(0xffC6E2FF),
                        )),
                    IconButton(
                        onPressed: submit,
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
                            color: Color(0xffC6E2FF),
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                      Icon(
                        Icons.thumb_up,
                        color: Color(0xffC6E2FF),
                        size: 16,
                      ),
                      Text(
                        widget.suggestion.downvote.toString(),
                        style: GoogleFonts.sourceCodePro(
                            color: Colors.redAccent,
                            fontSize: 12,
                            fontStyle: FontStyle.italic),
                      ),
                      Icon(
                        Icons.thumb_down,
                        color: Colors.redAccent,
                        size: 16,
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
