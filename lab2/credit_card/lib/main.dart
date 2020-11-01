import 'package:credit_card/card_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'credit_card_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider.value(
          value: CardModel(),
        )
      ], child: CreditCardScreen()),
    );
  }
}
