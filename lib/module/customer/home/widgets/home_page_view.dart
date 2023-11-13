import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/formats/character_input_format.dart';
import 'package:food_app/module/customer/home/bloc/food_data/food_data_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

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
            children: [FoodSidePage()],
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

     final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

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

        /// Food List

        BlocBuilder<FoodDataBloc, FoodDataState>( builder: (context, state) {
          if (state is FoodDataInitial) {
            return SizedBox(
              height: screenHeight * 0.6,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const FoodLoadingContainer();
                  }),
            );
          } else if (state is FoodDataLoadingState) {
            return SizedBox(
              height: screenHeight * 0.6,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const FoodLoadingContainer();
                  }),
            );
          } else if (state is FoodDataLoadedState) {
            return SizedBox(
              height: screenHeight * 0.6,
              child: ListView.builder(
                itemCount: state.foodList.length,
                itemBuilder: (context, index) {
                  return FoodContainer(
                    text: state.foodList[index]?.name ?? "Error",
                    price: state.foodList[index]?.price ?? "Error",
                  );
                },
              ),
            );
          } else if (state is FoodDataErrorState) {
            return Text(state.errorMessage ?? "Error");
          }
          return Container();
         
        })
      ],
    );
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer({super.key, required this.text, required this.price});
  final String text;
  final String price;
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
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(5, 10),
                  color: Colors.grey.shade300)
            ]),
            child: Column(
              children: [
                /// text for food name
                Text(
                  text,
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.black,
                      fontFamily: GoogleFonts.abel().fontFamily),
                ),

                ///text for price
                Text(
                  price,
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.orange.shade900,
                      fontFamily: GoogleFonts.abel().fontFamily),
                ),
              ],
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

class FoodLoadingContainer extends StatelessWidget {
  const FoodLoadingContainer({
    super.key,
  });

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
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  offset: const Offset(5, 10),
                  color: Colors.grey.shade300)
            ]),
            child: Column(
              children: [
                Shimmer(
                    gradient: LinearGradient(
                        colors: [Colors.grey.shade300, Colors.white]),
                    child: SizedBox(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.1,
                    )),

                ///text for price
                Shimmer(
                    gradient: LinearGradient(
                        colors: [Colors.grey.shade300, Colors.white]),
                    child: SizedBox(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.1,
                    )),
              ],
            ),
          ),
          Positioned(
            left: screenWidth * 0.5,
            child: Shimmer(
              gradient:
                  LinearGradient(colors: [Colors.grey.shade300, Colors.white]),
              child: SizedBox(
                width: screenWidth * 0.4,
                height: screenHeight * 0.25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
