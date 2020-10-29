import 'package:flutter/material.dart';
import 'circle_image.dart';
import 'button_row.dart';
import 'email_input.dart';

class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example 1"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5),
            CircleImage(),
            SizedBox(height: 40),
            ButtonRow(),
            SizedBox(height: 10),
            ButtonRow(),
            SizedBox(height: 20),
            EmailInput(),
          ],
        ),
      ),
    );
  }
}
