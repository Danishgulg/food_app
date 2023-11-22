import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/constants/firebase_firestore_constants.dart';
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

    return Center(
      child: SizedBox(
        height: screenHeight * 0.6,
        width: screenWidth,
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const FoodSidePage(
              key: PageStorageKey('page1'),
            ),
            Container(
              height: screenHeight * 0.2,
              width: screenWidth * 0.9,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}

/// food pageview containing the list of food data
class FoodSidePage extends StatelessWidget {
  const FoodSidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Column(
      key: key,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
          child: TextField(
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
        ),

        /// Food List

        BlocBuilder<FoodDataBloc, FoodDataState>(builder: (context, state) {
          ///initial

          if (state is FoodDataInitial) {
            return SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.52,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        const FoodLoadingContainer()));
          }

          ///loading

          else if (state is FoodDataLoadingState) {
            return SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.52,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        const FoodLoadingContainer()));
          }

          ///loaded

          else if (state is FoodDataLoadedState) {
            return SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight * 0.52,
              child: Center(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: screenWidth * 0.05),
                  itemCount: state.foodList.length,
                  itemBuilder: (context, index) => FoodContainer(
                      event: () {
                        if (state.foodList[index].liked == false) {
                          context.read<FoodDataBloc>().add(
                              LikedFoodDataAddEvent(
                                  state.foodList[index].toMap(),
                                  FirebaseFirestoreConstants.burgerFood, false));
                        }else{
                           context.read<FoodDataBloc>().add(
                              LikedFoodDataAddEvent(
                                  state.foodList[index].toMap(),
                                  FirebaseFirestoreConstants.burgerFood, true));
                        }
                      },
                      liked: state.foodList[index].liked,
                      text: state.foodList[index].name,
                      price: state.foodList[index].price),
                ),
              ),
            );
          }

          ///error

          else if (state is FoodDataErrorState) {
            var eror = state.errorMessage;
            return Text("error $eror");
          }

          ///if the state is not any of the above

          else {
            return const SizedBox(
              child: Text('Error'),
            );
          }
        })
      ],
    );
  }
}

class FoodContainer extends StatelessWidget {
  const FoodContainer(
      {super.key,
      required this.text,
      required this.price,
      required this.liked,
      required this.event});
  final String text;
  final String price;
  final bool liked;
  final void Function() event;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth * 0.5,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.loose,
        children: [
          Container(
            width: screenWidth * 0.35,
            height: screenHeight * 0.2,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(5, 10),
                      color: Colors.grey.shade300)
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),

                /// text for food name
                Text(
                  text,
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.black,
                      fontFamily: GoogleFonts.aDLaMDisplay().fontFamily),
                ),

                ///text for price
                Text(
                  price,
                  style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.orange.shade900,
                      fontFamily:
                          GoogleFonts.notoSansIndicSiyaqNumbers().fontFamily),
                ),
              ],
            ),
          ),
          Positioned(
            left: screenWidth * 0.17,
            top: screenHeight * 0.05,
            child: SizedBox(
                width: screenWidth * 0.3,
                height: screenHeight * 0.23,
                child: Image.asset('assets/images/pizza.png')),
          ),
          IconButton(
              onPressed: event,
              icon: Icon(liked ? Icons.favorite : Icons.favorite_outline_sharp,
                  color: liked ? Colors.red : Colors.black)),
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
                  color: Colors.grey.shade600)
            ]),
            child: Column(
              children: [
                Shimmer(
                    gradient: LinearGradient(
                        colors: [Colors.grey.shade600, Colors.black]),
                    child: SizedBox(
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.1,
                    )),

                ///text for price
                Shimmer(
                    gradient: LinearGradient(
                        colors: [Colors.grey.shade600, Colors.black]),
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
              direction: ShimmerDirection.ltr,
              gradient:
                  LinearGradient(colors: [Colors.grey.shade600, Colors.white]),
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
