import 'package:flutter/material.dart';
import 'screens/home/home.dart';

void main() => runApp(ValurGameService());

class ValurGameService extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Valur Game Services',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 218, 29, 35),
      fontFamily: 'Roboto Condensed'
    ),
    home: Home()
  );
}