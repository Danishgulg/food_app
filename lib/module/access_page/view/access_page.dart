import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/module/access_page/widget/selection_mode_container_acceess.dart';

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




