
import 'package:flutter/material.dart';
import 'package:food_app/data/formats/character_input_format.dart';

class HomeCustomPageView extends StatelessWidget {
  const HomeCustomPageView({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
      width: screenWidth * 0.9,
      height: screenHeight * 0.4,
      child: PageView(
        controller: pageController,
        children: [
          Column(
            children: [
              FoodSidePage()
            ],
          ),
          Container(
            height: screenHeight * 0.2,
            width: screenWidth * 0.9,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}

class FoodSidePage extends StatelessWidget {
  const FoodSidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          inputFormatters: [CharacterInputFormatter()],
          cursorColor: Colors.black,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10))),
              focusColor: Colors.black,
              hintText: "Search",
              isDense: true),

            
        ),
        FoodContainer()
      ],
    );
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
      width: screenWidth * 0.8,
      height: screenHeight * 0.3,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.loose,
        children: [
          Container(
            width: screenWidth * 0.8,
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(5, 10),
                  color: Colors.grey.shade300
                )
              ]
            ),
            child: Text(
              "Food"
            ),
          ),

          Positioned(
            left: screenWidth * 0.5,
            child: SizedBox(
              width: screenWidth * 0.4,
              height: screenHeight * 0.25,
              child: Image.asset('assets/images/pizza.png')),
          )
        ],
      ),
    );
  }
}
