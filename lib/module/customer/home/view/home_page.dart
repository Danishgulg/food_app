import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/formats/character_input_format.dart';
import 'package:food_app/module/customer/home/bloc/home_food_tab_bloc.dart';
import 'package:food_app/module/customer/home/widgets/food_tabs.dart';
import 'package:food_app/module/customer/home/widgets/home_appbar.dart';
import 'package:food_app/module/customer/home/widgets/home_page_view.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const pageName = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _searchTextEditingController;
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<AlignmentGeometry> _positionAnimation;

  @override
  void initState() {

   

      _searchTextEditingController = TextEditingController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
        _positionAnimation = Tween<AlignmentGeometry>(
  begin: Alignment.center, 
  end: Alignment.topLeft,).animate(_animationController);
        _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_animationController);

    
    super.initState();
  }

 

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          SlideTransition(
            position:  Tween<Offset>(begin: Offset(0, 0), end: Offset(0.3, 0)).animate(_animationController),
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: GestureDetector(
                onTap: (){
                  if(_animationController.status == AnimationStatus.completed){
                    _animationController.reverse();
                  }
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      HomeAppBar(drawerAnimationController: _animationController),
                      BlocBuilder<HomeFoodTabBloc, HomeFoodTabDataState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              CustomFoodTabs(
                                selected: state.foodSelected,
                                text: "Food",
                                event: () {
                                  context
                                      .read<HomeFoodTabBloc>()
                                      .add(FoodSelectedEvent());
                                },
                              ),
                              CustomFoodTabs(
                                selected: !state.foodSelected,
                                text: "Offer",
                                event: () {
                                  context
                                      .read<HomeFoodTabBloc>()
                                      .add(OfferSelectedEvent());
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      const HomeCustomPageView()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





