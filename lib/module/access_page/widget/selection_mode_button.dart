import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectModeButton extends StatelessWidget {
  const SelectModeButton({super.key, required this.event, required this.text});

  final String text;
  final void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return SizedBox(
        width: screenWidth * 0.6,
        height: screenHeight * 0.07,
        child: MaterialButton(
            onPressed: event,
            color: Colors.orange.shade200,
            splashColor: Colors.orange.shade700,
            elevation: 20,
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: GoogleFonts.aDLaMDisplay().fontFamily, fontSize: screenWidth * 0.05),
            )));
  }
}
