import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFoodTabs extends StatelessWidget {
  const CustomFoodTabs(
      {super.key,
      required this.selected,
      required this.text,
      required this.event});

  final bool selected;
  final String text;

  final void Function() event;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return GestureDetector(
      onTap: event,
      child: Padding(
        padding: EdgeInsets.only(left: screenWidth * 0.07),
        child: Row(
          children: [
            SizedBox(
              width: screenWidth * 0.3,
              height: screenHeight * 0.12,
              child: Column(children: [
                FittedBox(
                  child: Text(text,
                      style: TextStyle(
                          fontFamily: GoogleFonts.abel().fontFamily,
                          fontWeight: FontWeight.bold,
                          color: selected ? Colors.black : Colors.black26,
                          fontSize: screenHeight * 0.08)),
                ),
                if (selected)
                  Container(
                    height: 2,
                    width: screenWidth * 0.8,
                    color: Colors.orange,
                  )
              ]),
            )
          ],
        ),
      ),
    );
  }
}