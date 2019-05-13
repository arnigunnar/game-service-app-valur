import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() => runApp(ValurGameService());

class ValurGameService extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Valur Game Services',
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 218, 29, 35),
    ),
    home: Home()
  );
}

// class GameServiceApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _GameServiceApp();
//   }
// }

// class _GameServiceApp extends State<GameServiceApp> {


//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Valur Game Services',
//       theme: ThemeData(
//         primaryColor: Color.fromARGB(255, 218, 29, 35),
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Valur Game Service'),
//         ),
//         body: FutureBuilder<List<Game>>(
//           future: gameApi.getGames(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Text("Data has loaded :)");
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             } else {
//               return CircularProgressIndicator();
//             }
//           }
//         ),
//         // body: Container(
//         //   margin: EdgeInsets.all(8.0),
//         //   child: GameList(games)
//         // ),
//         backgroundColor: Color.fromARGB(255, 22, 28, 34),
//       ),
//     );
//   }
// }