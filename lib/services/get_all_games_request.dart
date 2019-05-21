class GetAllGamesRequest {

  int teamId;
  String gender;
  String sport;

  GetAllGamesRequest({
    this.teamId,
    this.gender,
    this.sport,
  });

  Map<String, dynamic> toBody() {
    var map = Map<String, dynamic>();

    map["teamId"] = this.teamId;
    map["gender"] = this.gender;
    map["sport"] = this.sport;

    return map;
  }

}