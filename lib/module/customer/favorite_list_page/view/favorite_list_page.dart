import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});

  @override
  State<FavoriteListPage> createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.05,

            ),
            child: Text(
              "Favorite Food",
              style: TextStyle(
                  color: Colors.orange,
                  fontFamily: GoogleFonts.aDLaMDisplay().fontFamily,
                  fontSize: 30),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.75,
            width: screenWidth * 0.9,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Expanded(
                  flex: 3,
                  child: FavoriteFoodContainer(
                    text: 'sdfsdfsdf',
                    price: '32',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteFoodContainer extends StatelessWidget {
  const FavoriteFoodContainer({
    super.key,
    required this.text,
    required this.price,
  });
  final String text;
  final String price;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: SizedBox(
        height: screenHeight * 0.3,
        child: Stack(
          clipBehavior: Clip.antiAlias,
          fit: StackFit.loose,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Container(
                height: screenHeight * 0.2,
                width: screenWidth * 0.9,
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
                          fontFamily: GoogleFonts.notoSansIndicSiyaqNumbers()
                              .fontFamily),
                    ),
                  ],
                ),
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
          ],
        ),
      ),
    );
  }
}
