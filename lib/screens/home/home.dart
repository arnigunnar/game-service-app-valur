import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/game.dart';
import '../../services/game_api.dart' as gameApi;
import '../../widgets/game_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _direction = "both";

  void onButtonPress(String newDirection) {
    setState(() {
      _direction = newDirection;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }



  Future<List<Game>> _getGames(direction) {
    return gameApi.getAllGames(direction);
  }

  Widget _getButton(String text) {
    var mainColor = Color.fromARGB(140, 211, 211, 208);

    return  FlatButton(
      onPressed: () {
        
      },

      child: Row(
        children: <Widget>[
          Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
          Text(
            text,
            style: TextStyle(
              color: mainColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<List<Game>>(
      future: _getGames(_direction),
      builder: (context, snapshot) {
        var buttonBarContainer = ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getButton("Grein"),
            _getButton("Flokkar"),
          ],
        );

        var gameListContainer = Center(
          child: CircularProgressIndicator()
        ) as Widget;

        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          gameListContainer = GameList(snapshot.data) as Widget;
        }

        return Container(
            color: Color.fromARGB(255, 218, 25, 39),
            padding: EdgeInsets.only(bottom: 8),
            child: Column(
              children: <Widget> [
                buttonBarContainer,
                gameListContainer
              ]
            )
        );

      }
    ),
  );

}