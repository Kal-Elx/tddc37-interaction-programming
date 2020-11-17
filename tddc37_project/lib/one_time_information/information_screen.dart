import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  final void Function() onClose;

  InformationScreen({@required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Here comes some information'),
            RaisedButton(
              onPressed: onClose,
              child: Text('Close'),
            )
          ],
        ),
      ),
    );
  }
}
