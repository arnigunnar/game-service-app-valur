import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/game.dart';
import '../../services/get_all_games_request.dart';
import '../../services/game_api.dart' as gameApi;
import '../../widgets/game_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _direction = "both";
  var gamesRequestBody = List<GetAllGamesRequest>();



  @override
  void initState() {
    // gamesRequestBody.add(GetAllGamesRequest(teamId: 111, gender: "male", sport: "football"));
    // gamesRequestBody.add(GetAllGamesRequest(teamId: 111, gender: "female", sport: "football"));

    super.initState();
    initializeDateFormatting();
  }

  Future<List<Game>> _getGames(direction) {
    return gameApi.getAllGames(direction);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      // title: Text("LEIKJAÞJÓNUSTA VALS"),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("LEIKJAÞJÓNUSTA VALS"),
          Image.asset(
            "assets/logo.png",
            fit: BoxFit.contain,
            height: 30,
          )
        ],
      ),
      elevation: 2,
    ),
    body: FutureBuilder<List<Game>>(
      future: _getGames(_direction),
      builder: (context, snapshot) {
        var widgets = List<Widget>();

        // GAME LIST CONTROLS:
        widgets.add(_getControls());

        // GAME LIST OR LOADER:
        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          widgets.add(GameList(snapshot.data));
        } else {
          widgets.add(Center(
            child: CircularProgressIndicator()
          ));
        }

        return Container(
            color: Color.fromARGB(255, 244, 244, 244),
            padding: EdgeInsets.only(bottom: 8),
            child: Column(
              children: widgets
            )
        );

      }
    ),
  );

  Widget _getControls() {
    return Container(
      padding: EdgeInsets.all(6),
      child: Column(
        children: <Widget> [
          Row(
            children: <Widget>[
              _getControl("Velja greinar"),
              _getControl("Velja flokka"),
              _getControl("Hvaða leiki viltu sjá?"),
            ],
          ),

        ],
      ),
    );
  }

  Widget _getControl(String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Text(
              label.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 10, color: Colors.grey ),
            ),
            RaisedButton(
              onPressed: () {},
              elevation: 0,
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:Text(
                      "Úrslit og Næstu",
                      style: TextStyle(fontSize: 14),
                    )
                  ),
                  Icon(
                    Icons.edit,
                    size: 14,
                  ),
                ],
              ),
            ),

          ],
        )
      )
    );
  }

}