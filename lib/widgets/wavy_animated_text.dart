import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WaveyAnimatedText extends StatelessWidget {
  const WaveyAnimatedText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText(
          "Select the mode",
          textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontFamily: GoogleFonts.aDLaMDisplay().fontFamily,
              color: Colors.white,
              fontSize: screenWidth * 0.07),
          // duration: const Duration(milliseconds: 700),
        )
      ],
      repeatForever: false,
    );
  }
}
