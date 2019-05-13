class Game {
  String id;
  String sport;
  String homeTeam;
  String awayTeam;
  int scoreHomeTeam;
  int scoreAwayTeam;
  String stadium;
  String tournament;
  DateTime date;

  Game({
    this.id,
    this.sport,
    this.homeTeam,
    this.awayTeam,
    this.scoreHomeTeam,
    this.scoreAwayTeam,
    this.stadium,
    this.tournament,
    // this.date,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      sport: json['sport'],
      homeTeam: json['homeTeam']['name'],
      awayTeam: json['awayTeam']['name'],
      scoreHomeTeam: json['fullTimeScore']['homeTeam'],
      scoreAwayTeam: json['fullTimeScore']['awayTeam'],
      stadium: json['stadium']['name'],
      tournament: json['tournament']['name'],
      // date: json['date'],
    );
  }
}