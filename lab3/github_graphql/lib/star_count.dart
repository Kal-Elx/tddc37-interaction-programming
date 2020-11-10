import 'package:flutter/material.dart';

class StarCount extends StatelessWidget {
  final int count;

  StarCount(this.count);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      child: Row(
        children: [
          Icon(Icons.star),
          Text(count > 1000
              ? '${(count / 1000.0).toStringAsFixed(1)}k'
              : count.toString()),
        ],
      ),
    );
  }
}
