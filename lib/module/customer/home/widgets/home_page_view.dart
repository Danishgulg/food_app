
import 'package:flutter/material.dart';
import 'package:food_app/data/formats/character_input_format.dart';

class HomeCustomPageView extends StatelessWidget {
  const HomeCustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.4,
      child: PageView(
        children: [
          Column(
            children: [
              TextField(
                inputFormatters: [CharacterInputFormatter()],
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10))),
                            focusColor: Colors.black,
                    
                    hintText: "Search",
                    isDense: true),
              )
            ],
          )
        ],
      ),
    );
  }
}
