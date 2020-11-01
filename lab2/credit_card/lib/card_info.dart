import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'focus_box.dart';

class CardInfo extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final String value;
  final bool focused;

  CardInfo({
    @required this.width,
    @required this.height,
    @required this.title,
    @required this.value,
    @required this.focused,
  });

  @override
  Widget build(BuildContext context) {
    return FocusBox(
      width: width,
      enabled: focused,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.sourceCodePro(
              color: Colors.grey,
              fontSize: height * 0.04,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: height * 0.06,
              fontFeatures: [
                FontFeature.tabularFigures(),
                FontFeature.slashedZero(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
