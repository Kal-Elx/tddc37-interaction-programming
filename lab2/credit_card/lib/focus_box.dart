import 'package:flutter/material.dart';

class FocusBox extends StatelessWidget {
  final Widget child;
  final double width;
  final bool enabled;

  FocusBox({
    @required this.child,
    @required this.width,
    @required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: enabled ? Colors.white : Colors.transparent),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: child,
      ),
    );
  }
}
