import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'form_element_title.dart';
import 'form_element_input.dart';

class TextFormElement extends StatelessWidget {
  final String title;
  final void Function(bool) focusFunc;
  final void Function(String) updateFunc;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;

  TextFormElement({
    @required this.title,
    @required this.focusFunc,
    @required this.updateFunc,
    @required this.keyboardType,
    @required this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormElementTitle(title: title),
        FormElementInput(
            focusFunc: focusFunc,
            updateFunc: updateFunc,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters),
      ],
    );
  }
}
