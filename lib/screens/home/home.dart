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

  Widget _getButton(String text, bool isSelected, String direction) {
    var mainColor = Color.fromARGB(140, 211, 211, 208);

    if (isSelected) {
      mainColor = Color.fromARGB(255, 211, 211, 208);
    }

    return  FlatButton(
      onPressed: () {
        onButtonPress(direction);
      },
      child: Text(
        text,
        style: TextStyle(
          color: mainColor,
        ),
      ),
      shape: Border.all(
        width: 1.0,
        color: mainColor,
        style: BorderStyle.solid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Allir leikir'),
    ),
    body: FutureBuilder<List<Game>>(
      future: _getGames(_direction),
      builder: (context, snapshot) {
        var buttonBarContainer = ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getButton("BLANDAÐ", (_direction == "both"), "both"),
            _getButton("ÚRSLIT", (_direction == "onlyresults"), "onlyresults"),
            _getButton("NÆSTU LEIKIR", (_direction == "onlyfixtures"), "onlyfixtures"),
          ],
        );

        var gameListContainer = Center(
          child: CircularProgressIndicator()
        ) as Widget;

        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          gameListContainer = GameList(snapshot.data) as Widget;
        }

        return Container(
            color: Color.fromARGB(255, 46, 58, 73),
            padding: EdgeInsets.all(8),
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