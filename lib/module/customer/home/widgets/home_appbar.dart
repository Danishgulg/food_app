
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.drawerAnimationController});

  final AnimationController drawerAnimationController;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    //tabs of food and Offers
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.03),
      child: SizedBox(
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  drawerAnimationController.forward();
                },
                icon: Icon(
                  Icons.clear_all_outlined,
                  size: screenHeight * 0.06,
                )),
            Text(
              "Break Fast",
              style: TextStyle(fontSize: screenWidth * 0.055),
            ),
          ],
        ),
      ),
    );
  }
}