import 'package:flutter/material.dart';

class FocusBox extends StatefulWidget {
  final Widget child;
  final double width;

  FocusBox({@required this.child, @required this.width});

  @override
  _FocusBoxState createState() => _FocusBoxState();
}

class _FocusBoxState extends State<FocusBox> {
  bool _focus = false;

  void focus(bool foucs) {
    setState(() {
      _focus = foucs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        border: _focus ? Border.all(color: Colors.white) : null,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: widget.child,
      ),
    );
  }
}
