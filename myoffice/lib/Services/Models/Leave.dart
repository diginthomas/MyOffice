class Leave {
  int id;
  int userid;
  String name;
  String postion;
  String appliedDate;
  String leaveDate;
  int leaveCount;
  String reason;
  int status;
  Leave(
      {required this.id,
      required this.userid,
      required this.name,
      required this.postion,
      required this.appliedDate,
      required this.leaveDate,
      required this.leaveCount,
      required this.reason,
      required this.status});
}
