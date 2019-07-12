class GetAllGamesRequest {

  String teamId;
  String gender;
  String sport;
  String age;

  GetAllGamesRequest({
    this.teamId,
    this.gender,
    this.sport,
    this.age,
  });

  Map<String, dynamic> toBody() {
    var map = Map<String, dynamic>();

    map["teamId"] = this.teamId;
    map["gender"] = this.gender;
    map["sport"] = this.sport;
    map["age"] = this.age;

    return map;
  }

}