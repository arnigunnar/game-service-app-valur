import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/game.dart';
import '../../models/game_list_filtering_type.dart';
import '../../services/get_all_games_request.dart';
import '../../services/game_api.dart' as gameApi;
import '../../widgets/game_list.dart';
import 'settings_dialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _direction = "both";
  var _gamesRequestBody = List<GetAllGamesRequest>();
  bool _football = true;
  bool _handball = false;
  bool _mflka = true;
  bool _mflkv = true;

  void onSettingsSave(List<bool> values, gameListFilteringType type) {
    if (type == gameListFilteringType.sport) {
      final body = _setRequestBody(values[0], values[1], _mflka, _mflkv);

      setState(() {
        _football = values[0];
        _handball = values[1];
        _gamesRequestBody = body;
      });
    } else if (type == gameListFilteringType.category) {
      final body = _setRequestBody(_football, _handball, values[0], values[1]);

      setState(() {
        _mflka = values[0];
        _mflkv = values[1];
        _gamesRequestBody = body;
      });
    }
  }

  List<GetAllGamesRequest> _setRequestBody(bool football, bool handball, bool mflka, bool mflkv) {
    var _body = List<GetAllGamesRequest>();

    if (football && mflka) {
      _body.add(GetAllGamesRequest(teamId: 101, gender: "male", sport: "football"));  
    }
  
      if (football && mflkv) {
      _body.add(GetAllGamesRequest(teamId: 101, gender: "female", sport: "football"));  
    }

    return _body;
  }

  @override
  void initState() {
    _gamesRequestBody = _setRequestBody(true, true, true, true);

    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
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
      future: _getGames(_direction, _gamesRequestBody),
      builder: (context, snapshot) {
        var widgets = List<Widget>();

        // GAME LIST CONTROLS:
        widgets.add(_getControls());

        // DIRECTION SELECTOR:
        widgets.add(_getDirectionControls());

        // GAME LIST OR LOADER:
        if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
          widgets.add(
            Expanded(
              child: GameList(snapshot.data))
            );
        } else {
          widgets.add(
            Expanded(
              child: Center(
                child: CircularProgressIndicator()
              )
            )
          );
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

  // BUILD CONTROLS ON TOP OF GAME LIST:
  Widget _getControls() {
    return Container(
      padding: EdgeInsets.all(6),
      child: Column(
        children: <Widget> [
          Row(
            children: <Widget>[
              _getControl("Velja greinar", gameListFilteringType.sport),
              _getControl("Velja flokka", gameListFilteringType.category),
            ],
          ),
        ],
      ),
    );
  }

  // GET A SINGLE CONTROL:
  Widget _getControl(String label, gameListFilteringType type) {
    List<bool> setValues = [false, false];

    if (type == gameListFilteringType.sport) {
      setValues[0] = _football;
      setValues[1] = _handball;
    } else if (type == gameListFilteringType.category) {
      setValues[0] = _mflka;
      setValues[1] = _mflkv;
    }

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
              onPressed: () => showDialog(
                context: context,
                builder: (context) => SettingsDialog(filterType: type, onSubmit: onSettingsSave, setValues: setValues),
              ),
              elevation: 0,
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:Text(
                      (type == gameListFilteringType.sport ? "Íþróttagreinar" : "Flokkar"),
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

  // GET DIRECTION CONROLS:
  Widget _getDirectionControls() {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      color: Color.fromARGB(255, 190, 190, 190),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget> [
            Expanded(
              child: FlatButton(
                onPressed: () {
                  setState(() { _direction = "both"; });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: (_direction == "both" ? Color.fromARGB(255, 218, 29, 35) : Color.fromARGB(255, 190, 190, 190)),
                    width: 3,
                  )
                ),
                child: Text(
                  "BLANDAÐ",
                  style: TextStyle(
                    color: (_direction == "both" ? Colors.white : Color.fromARGB(255, 150, 150, 150)),
                  )
                )
              )
            ),
            Expanded(
              child:FlatButton(
                onPressed: () {
                  setState(() { _direction = "onlyresults"; });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: (_direction == "onlyresults" ? Color.fromARGB(255, 218, 29, 35) : Color.fromARGB(255, 190, 190, 190)),
                    width: 3,
                  )
                ),
                child: Text(
                  "NÝJUSTU ÚRSLIT",
                  style: TextStyle(
                    color: (_direction == "onlyresults" ? Colors.white : Color.fromARGB(255, 150, 150, 150)),
                  )
                )
              )
            ),
            Expanded(
              child:FlatButton(
                onPressed: () {
                  setState(() { _direction = "onlyfixtures"; });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: (_direction == "onlyfixtures" ? Color.fromARGB(255, 218, 29, 35) : Color.fromARGB(255, 190, 190, 190)),
                    width: 3,
                  )
                ),
                child: Text(
                  "NÆSTU LEIKIR",
                  style: TextStyle(
                    color: (_direction == "onlyfixtures" ? Colors.white : Color.fromARGB(255, 150, 150, 150)),
                  )
                )
              )
            ),
          ]
        ),
      )
    );
  }

  // LOAD GAMES FROM API:
  Future<List<Game>> _getGames(direction, body) {
    return gameApi.getAllGames(direction, body);
  }

}