import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RotationAnimatedText extends StatelessWidget {
  final String fixedTxt;
  final List<String> animatedTxts;
  final Color txtColor;
  final double txtSize;

  const RotationAnimatedText({
    required this.fixedTxt,
    required this.animatedTxts,
    required this.txtColor,
    required this.txtSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 70),
        Text(
          fixedTxt,
          style: TextStyle(fontSize: txtSize, color: txtColor),
        ),
        const SizedBox(width: 15, height: 70),
        DefaultTextStyle(
          style: GoogleFonts.fredokaOne(
            textStyle: TextStyle(fontSize: txtSize, color: txtColor),
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: true,
            repeatForever: true,
            animatedTexts:
                animatedTxts.map((t) => RotateAnimatedText(t)).toList(),
          ),
        ),
      ],
    );
  }
}
