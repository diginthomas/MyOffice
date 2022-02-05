class Suggestion {
  int id;
  String content;
  String date;
  int upvote, downvote;
  Suggestion(
      {required this.id,
      required this.content,
      required this.date,
      this.upvote = 0,
      this.downvote = 0});
}
