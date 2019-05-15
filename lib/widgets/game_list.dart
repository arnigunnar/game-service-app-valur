import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/game.dart';

class GameList extends StatelessWidget {
  final List<Game> _games;

  GameList(this._games);

  Widget _buildGameItem(BuildContext context, int index) {
    var game = _games[index];
    var score = game.scoreHomeTeam.toString() + "-" + game.scoreAwayTeam.toString();

    if (game.status == "") {
      score = "-";
    }

    return Container(
      color: Color.fromARGB(255, 69, 84, 101),
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 8),
            child: Center(
              child: Text(
                "${_getSportString(game.sport)}  |  ${_getGenderString(game.gender)}  |  ${game.tournament}".toUpperCase(),
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
                      game.homeTeam.toUpperCase(),
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
                    score,
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
                      game.awayTeam.toUpperCase(),
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
                "${game.stadium}  |  ${DateFormat("d. MMM HH:mm", "is").format(game.date)}".toUpperCase(),
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
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: _buildGameItem,
        itemCount: _games.length,
      )
    );
  }

  String _getGenderString(String gender) {
    switch (gender) {
      case "male":
        return "Karlar";
      case "female":
        return "Konur";
      default:
        return "";
    }
  }

  String _getSportString(String sport) {
    switch (sport) {
      case "football":
        return "Fótbolti";
      case "handball":
        return "Handbolti";
      default:
        return "";
    }

  }

}