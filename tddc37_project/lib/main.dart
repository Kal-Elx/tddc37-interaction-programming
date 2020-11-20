import 'package:flutter/material.dart';

import 'one_time_information/one_time_information.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OneTimeInformation(nextScreen: HomeScreen()),
    );
  }
}
