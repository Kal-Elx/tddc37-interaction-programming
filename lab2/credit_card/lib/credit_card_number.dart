import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'focus_box.dart';

class CreditCardNumber extends StatelessWidget {
  final double width;
  final String number;
  final bool focused;

  CreditCardNumber({
    @required this.width,
    @required this.number,
    @required this.focused,
  });

  @override
  Widget build(BuildContext context) {
    return FocusBox(
      width: width,
      enabled: focused,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          number,
          style: GoogleFonts.sourceSansPro(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            wordSpacing: width * 0.03,
            fontFeatures: [
              FontFeature.tabularFigures(),
              FontFeature.slashedZero(),
            ],
          ),
        ),
      ),
    );
  }
}
