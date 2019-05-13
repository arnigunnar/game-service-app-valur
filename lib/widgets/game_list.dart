import 'package:flutter/material.dart';
import '../models/game.dart';

class GameList extends StatelessWidget {
  final List<Game> _games;

  GameList(this._games);

  Widget _buildGameItem(BuildContext context, int index) {
    return Card(
      color: Color.fromARGB(255, 69, 84, 101),
      child: Column(
        children: [
          
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Center(
              child: Text(
                "Knattspyrna / Meistaraflokkur karla / ${_games[index].tournament}",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 11,
                ),
              )
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(_games[index].homeTeam, textAlign: TextAlign.right),
                  ],
                ),
              ),
              Container(
                width: 50,
                height: 40,
                child: Center(
                  child: Text(
                    _games[index].scoreHomeTeam.toString() + "-" + _games[index].scoreAwayTeam.toString(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 242, 122, 123),
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(_games[index].awayTeam, textAlign: TextAlign.right),
                  ],
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Center(
              child: Text(
                "${_games[index].stadium} / 23. maí 2019 kl. 20:00",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 11,
                ),
              )
            )
          ),

        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildGameItem,
      itemCount: _games.length
    );
  }
}