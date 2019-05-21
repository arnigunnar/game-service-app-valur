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

  @override
  void initState() {
    _gamesRequestBody.add(GetAllGamesRequest(teamId: 101, gender: "male", sport: "football"));
    _gamesRequestBody.add(GetAllGamesRequest(teamId: 101, gender: "female", sport: "football"));

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
              _getControl("Velja greinar", gameListFilteringType.sport),
              _getControl("Velja flokka", gameListFilteringType.category),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getControl(String label, gameListFilteringType type) {
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
                builder: (context) => SettingsDialog(filterType: type),
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

  Future<List<Game>> _getGames(direction, body) {
    return gameApi.getAllGames(direction, body);
  }



  // Future<void> _askForGameSelection(String label, buttonType type) async {
  //     var _widgets = List<Widget>();

  //     if (type == buttonType.sport) {
  //       _widgets.add(Row(
  //         children: <Widget>[
  //           Checkbox(
  //             value: true,
  //             onChanged: (bool value) {
                
  //             },
  //           ),
  //           Text("Fótbolti"),
  //         ],
  //       ));
  //       _widgets.add(Row(
  //         children: <Widget>[
  //           Checkbox(
  //             value: true,
  //             onChanged: (bool value) {
                
  //             },
  //           ),
  //           Text("Handbolti"),
  //         ],
  //       ));
  //     } else if (type == buttonType.category) {
  //       _widgets.add(Row(
  //         children: <Widget>[
  //           Checkbox(
  //             value: _mflka,
  //             onChanged: (bool value) {
  //               print(value);
  //               print(_mflka);
  //               setState(() {
  //                 _mflka = value;
  //               });
  //             },
  //           ),
  //           Text("Meistaraflokkur karla"),
  //         ],
  //       ));
  //       _widgets.add(Row(
  //         children: <Widget>[
  //           Checkbox(
  //             value: true,
  //             onChanged: (bool value) {
  //               print(value);
  //             },
  //           ),
  //           Text("Meistaraflokkur kvenna"),
  //         ],
  //       ));
  //     }

  //     _widgets.add(
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: <Widget> [
  //           RaisedButton(
  //             color: Color.fromARGB(255, 218, 29, 35),
  //             textColor: Colors.white,
  //             onPressed: () {},
  //             child: Text("Vista stillingar")
  //           )
  //         ]
  //       )
  //     );

  //     switch (await showDialog(context: context, builder: (BuildContext context) {
  //       return SimpleDialog(
  //         title: Text(label.toUpperCase()),
  //         elevation: 2,
  //         children: _widgets,
  //       );
  //     })) {
  //       case "": _getGames("both", _gamesRequestBody); break;
  //     }

  // }

}