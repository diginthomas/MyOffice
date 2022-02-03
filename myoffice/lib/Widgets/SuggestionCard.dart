import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionCard extends StatefulWidget {
  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF7F2FD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(14),
              child: Text(
                'wee need fredom',
                style: GoogleFonts.sourceCodePro(
                    fontSize: MediaQuery.of(context).size.width / 18),
              )),
          Divider(
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    print('object');
                  },
                  icon: Icon(
                    Icons.thumb_up,
                    color: Color(0xffC6E2FF),
                  )),
              IconButton(
                  onPressed: () {
                    print('object');
                  },
                  icon: Icon(
                    Icons.thumb_down,
                    color: Colors.redAccent,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
