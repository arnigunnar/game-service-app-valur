import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/game.dart';

class GameList extends StatelessWidget {
  final List<Game> _games;

  GameList(this._games);

  Widget _buildGameItem(BuildContext context, int index) {
    var game = _games[index];

    return Container(
      color: Color.fromARGB(255, 240, 240, 240),
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [

          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "${_getSportString(game.sport)}  |  ${_getGenderString(game.gender)}  |  ${game.tournament}".toUpperCase(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 31, 42),
                      fontSize: 9,
                    ),
                  )
                ),
                Expanded(
                  child: Text(
                    "${game.stadium}  |  ${DateFormat("d. MMM HH:mm", "is").format(game.date)}".toUpperCase(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color.fromARGB(255, 100, 31, 42),
                      fontSize: 9,
                    ),
                  )
                ),
              ],
            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        game.homeTeam.toUpperCase(),
                        style: TextStyle(
                          color: Color.fromARGB(255, 218, 25, 39),
                          fontSize: 18,
                        )  
                      )
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                height: 35,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 48,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 100, 31, 42),
                        borderRadius: new BorderRadius.all(new Radius.circular(3)),
                      ),
                      margin: EdgeInsets.only(left: 2),
                      child: Center(
                        child: Text(
                          game.scoreHomeTeam.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )
                        )
                      )
                    ),
                    Container(
                      width: 48,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 100, 31, 42),
                        borderRadius: new BorderRadius.all(new Radius.circular(3)),
                      ),
                      margin: EdgeInsets.only(left: 2),
                      child: Center(
                        child: Text(
                          game.scoreAwayTeam.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )
                        )
                      )
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        game.awayTeam.toUpperCase(),
                        style: TextStyle(
                          color: Color.fromARGB(255, 218, 25, 39),
                          fontSize: 18,
                        )  
                      ),
                    ),
                  ],
                ),
              ),
            ],
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