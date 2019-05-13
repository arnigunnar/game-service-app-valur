class Team {
  String name;

  Team({
    this.name
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name']
    );
  }
}