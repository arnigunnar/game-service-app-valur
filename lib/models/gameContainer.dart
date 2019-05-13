import 'game.dart';

class GameContainer {
  Game game;

  GameContainer({
    this.game
  });

  factory GameContainer.fromJson(Map<String, dynamic> json) {
    return GameContainer(
      game: Game.fromJson(json['game']),
    );
  }
}