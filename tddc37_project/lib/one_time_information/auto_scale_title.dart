import 'package:flutter/material.dart';

class AutoScaleTitle extends StatelessWidget {
  final String title;
  final double maxFontSize;

  const AutoScaleTitle({
    @required this.title,
    @required this.maxFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontSize: maxFontSize,
        ),
      ),
    );
  }
}
