import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormElementInput extends StatelessWidget {
  const FormElementInput({
    Key key,
    @required this.focusFunc,
    @required this.updateFunc,
    @required this.keyboardType,
    @required this.inputFormatters,
  }) : super(key: key);

  final void Function(bool p1) focusFunc;
  final void Function(String p1) updateFunc;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: focusFunc,
      child: TextFormField(
        onChanged: updateFunc,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
