import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormElementTitle extends StatelessWidget {
  const FormElementTitle({
    @required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0, bottom: 4.0, top: 16.0),
      child: Text(
        title,
        style: GoogleFonts.sourceSansPro(fontSize: 16),
      ),
    );
  }
}
