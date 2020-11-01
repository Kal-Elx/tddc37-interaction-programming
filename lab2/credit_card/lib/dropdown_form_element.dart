import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownFormElement extends StatefulWidget {
  final String hint;
  final void Function(bool) focusFunc;
  final void Function(String) updateFunc;
  final List<String> values;

  DropdownFormElement({
    @required this.hint,
    @required this.focusFunc,
    @required this.updateFunc,
    @required this.values,
  });

  @override
  _DropdownFormElementState createState() => _DropdownFormElementState();
}

class _DropdownFormElementState extends State<DropdownFormElement> {
  String _val;
  FocusNode _node;
  bool _opened = false;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _node = FocusNode();
    _node.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _node.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focused && !_opened) {
      _opened = true;
      _focused = false;
      widget.focusFunc(true);
    } else if (_opened && !_focused && _node.hasFocus) {
      _dismissDropDown();
    }
  }

  void _dismissDropDown() {
    widget.focusFunc(false);
    _opened = false;
    _focused = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: DropdownButton<String>(
          onTap: () {
            _focused = true;
            _node.requestFocus();
          },
          value: _val,
          elevation: 16,
          focusNode: _node,
          onChanged: (newValue) {
            widget.updateFunc(newValue);
            _dismissDropDown();
            FocusManager.instance.primaryFocus.unfocus();
            setState(() {
              _val = newValue;
            });
          },
          hint: Text(
            widget.hint,
            style: GoogleFonts.sourceSansPro(),
          ),
          underline: Container(),
          items: widget.values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(
                child: Text(
                  value,
                  style: GoogleFonts.sourceSansPro(),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
