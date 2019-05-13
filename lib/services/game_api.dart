import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/game.dart';

Future<List<Game>> getGames() async {
  List<Game> list;
  final String base = "https://cc-game-service.azurewebsites.net";
  final String url = base + "/api/teams/football/101/games/?limit=3&offset=60&gender=male";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    list = (json.decode(response.body) as List)
      .map((data) => Game.fromJson(data))
      .toList();
  } else {
    throw Exception("Failed to load games!");
  }

  return list;
}