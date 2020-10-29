import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text("BUTTON"),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text("BUTTON"),
        ),
      ],
    );
  }
}
