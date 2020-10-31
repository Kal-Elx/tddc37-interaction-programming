import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CVV extends StatelessWidget {
  final double width;

  const CVV(this.width);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: width * 0.01,
          ),
          child: Text(
            "CVV",
            style: GoogleFonts.sourceSansPro(
              fontSize: width * 0.04,
              color: Colors.white,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(width * 0.01),
          child: Container(
            color: Colors.white,
            width: width,
            height: width * 0.11,
            child: Padding(
              padding: EdgeInsets.only(right: width * 0.03),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  '****',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: width * 0.06,
                  ),
                ),
              ),
            ),
            alignment: FractionalOffset.centerRight,
          ),
        ),
      ],
    );
  }
}
