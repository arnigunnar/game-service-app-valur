import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/game.dart';
import 'get_all_games_request.dart';

Future<List<Game>> getAllGames(String direction, List<GetAllGamesRequest> body, int gameCount) async {
  List<Game> list;
  final String base = "https://cc-game-service.azurewebsites.net";
  final String url = base + "/api/teams/games/?offset=90&limit=${gameCount}&direction=${direction.toLowerCase()}";

  var data = List<Map<String, dynamic>>();

  for (int i = 0; i < body.length; i++) {
    data.add(body[i].toBody());
  }

  final response = await http.post(
    Uri.parse(url),
    body: json.encode(data),
    headers: {
      "Content-Type": "application/json"
    }
  );

  if (response.statusCode == 200) {
    list = (json.decode(response.body) as List)
      .map((data) => Game.fromJson(data))
      .toList();
  } else if (response.statusCode == 404) {
    throw Exception("No games found ...");
  } else {
    throw Exception("Failed to load games!");
  }

  return list;
}