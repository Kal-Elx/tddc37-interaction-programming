import 'package:flutter/material.dart';

import 'one_time_information/one_time_information.dart';
import 'one_time_information/info_card.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Color(0xfff1f9ff),
      ),
      home: OneTimeInformation(
        title: 'WELCOME TO MY PROJECT',
        information: [
          InfoCard(),
          InfoCard(),
          InfoCard(),
          InfoCard(),
        ],
        dismissText: "LET'S START",
        nextScreen: HomeScreen(),
      ),
    );
  }
}
