import 'package:flutter/material.dart';
import '../models/game.dart';

class GameList extends StatelessWidget {
  final List<Game> _games;

  GameList(this._games);

  Widget _buildGameItem(BuildContext context, int index) {
    return Container(
      color: Color.fromARGB(255, 69, 84, 101),
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Center(
              child: Text(
                "Knattspyrna  |  Meistaraflokkur karla  |  ${_games[index].tournament}".toUpperCase(),
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              )
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      _games[index].homeTeam.toUpperCase(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 211, 211, 208),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )  
                    ),
                  ],
                ),
              ),
              Container(
                width: 80,
                height: 45,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _games[index].awayTeam.toUpperCase(),
                      style: TextStyle(
                        color: Color.fromARGB(255, 211, 211, 208),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )  
                    ),
                  ],
                ),
              ),
            ],
          ),

          Container(
            padding: EdgeInsets.only(bottom: 8),
            child: Center(
              child: Text(
                "${_games[index].stadium}  |  23. maí 2019 kl. 20:00".toUpperCase(),
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
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
    return Container(
      color: Color.fromARGB(255, 46, 58, 73),
      padding: EdgeInsets.all(8),
      child: ListView.builder(
        itemBuilder: _buildGameItem,
        itemCount: _games.length,
      )
    );
  }
}