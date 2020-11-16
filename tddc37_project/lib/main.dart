import 'package:flutter/material.dart';

import 'image_sequence_picker/image_sequence_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Save reference to widget to be able to fetch result.
    final imageSequencePicker = ImageSequencePicker();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TDDC37 project'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 300,
              child: imageSequencePicker,
            ),
            RaisedButton(
              child: Text('Publish'),
              onPressed: () {
                // TODO: Do something cool with the images.
                print(imageSequencePicker.images);
              },
            ),
          ],
        ),
      ),
    );
  }
}
