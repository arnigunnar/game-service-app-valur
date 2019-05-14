import 'package:flutter/material.dart';
import '../../models/game.dart';
import '../../services/game_api.dart' as gameApi;
import '../../widgets/game_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Allir leikir'),
    ),
    body: FutureBuilder<List<Game>>(
      future: gameApi.getGames(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GameList(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 2)
          );
        }
      }
    ),
  );
}