import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'focus_box.dart';

class CreditCardNumber extends StatelessWidget {
  final double width;

  CreditCardNumber(this.width);

  @override
  Widget build(BuildContext context) {
    return FocusBox(
      width: width,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          "#### #### #### ####",
          style: GoogleFonts.sourceSansPro(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            wordSpacing: width * 0.03,
          ),
        ),
      ),
    );
  }
}
