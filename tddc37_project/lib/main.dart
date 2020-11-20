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
          InfoCard(
              title: 'Introduction',
              body:
                  'This is an example app with the widgets I have developed in TDDC37.\nThe first one is ImageSequencePicker. As the name suggests it lets you pick a sequence of images.\nThe second widget is OneTimeInformation and you are actually looking at it now!'),
          InfoCard(
            title: 'ImageSequencePicker',
            resource: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 200,
                ),
                Icon(
                  Icons.photo,
                  size: 200,
                ),
              ],
            ),
            body:
                "This widget let's you add images by picking from your gallery or taking a new one using the camera. Ones you have choosen the images you can reorder them by holding and dragging.\nThe widget is configurable. You can for example change the scroll axis and the dimensions of the pictures.",
          ),
          InfoCard(
            title: 'OneTimeInformation',
            body:
                'This widget is used for showing information to a user once.\nThis can for example be useful when a user opens a new feature for the first time.\nThese information cards can be configured with a title, body and a resource (arbitrary widget).\nFor the purpose of testing I have added a reset button in the action bar.\nIf pressed the app forgets that the user has seen this information before and shows it the next time the app is opened.',
          ),
        ],
        dismissText: "LET'S CONTINUE",
        nextScreen: HomeScreen(),
      ),
    );
  }
}
