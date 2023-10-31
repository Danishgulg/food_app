import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/module/customer/dashbord/view/dashboard_page.dart';
import 'package:google_fonts/google_fonts.dart';

class AccessPage extends StatelessWidget {
  const AccessPage({super.key});

  static const pageName = "AccessPage";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/splash_screen_image.jpg"),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0), // Adjust the sigma values for blur intensity
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [SelectionModeContainer()],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionModeContainer extends StatelessWidget {
  const SelectionModeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return FittedBox(
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.7,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(50)),
        child: Column(
          children: [
            SizedBox(height:  screenHeight * 0.05,),
            const WaveyAnimatedText(text: "Select the mode"),
    
            SizedBox(height:  screenHeight * 0.1,),
            SelectModeButton(
              text: "Manager",
              event: () {},
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            SelectModeButton(
              text: "Supplier",
              event: () {},
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            SelectModeButton(
              text: "Customer",
              event: () {
                Navigator.of(context).pushNamed(DashboardPage.pageName);
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
