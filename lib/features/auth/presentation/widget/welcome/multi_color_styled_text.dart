import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_text/styled_text.dart';

class MultiColoredStyledText extends StatelessWidget {
  const MultiColoredStyledText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StyledText(
      text:
          '<bold>Explore your <red>best</red>\n<red>movies</red> collection</bold>.',
      tags: {
        'bold': StyledTextTag(
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        'red': StyledTextTag(
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.redAccent,
            fontFamily: 'SecularOne-Regular',
          ),
        ),
      },
      style: const TextStyle(
        fontSize: 35,
      ),
    );
  }
}
