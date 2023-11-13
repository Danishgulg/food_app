import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/module/customer/home/bloc/home_food_tab_bloc.dart';
import 'package:food_app/module/customer/home/widgets/food_tabs.dart';
import 'package:food_app/module/customer/home/widgets/home_appbar.dart';
import 'package:food_app/module/customer/home/widgets/home_page_view.dart';

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
  late final PageController _homePageController;

  @override
  void initState() {
    _homePageController = PageController();
    _searchTextEditingController = TextEditingController();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _positionAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.center,
      end: Alignment.topLeft,
    ).animate(_animationController);
    _scaleAnimation =
        Tween<double>(begin: 1, end: 0.6).animate(_animationController);

    
    super.initState();
  }

  @override
  void dispose() {
    _searchTextEditingController.dispose();
    _homePageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Colors.amber,
          ),
          SlideTransition(
            position: Tween<Offset>(begin: Offset(0, 0), end: Offset(0.3, 0))
                .animate(_animationController),
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: GestureDetector(
                onTap: () {
                  if (_animationController.status ==
                      AnimationStatus.completed) {
                    _animationController.reverse();
                  }
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      HomeAppBar(
                          drawerAnimationController: _animationController),
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

                                  _homePageController.animateToPage(0,
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                },
                              ),
                              CustomFoodTabs(
                                selected: !state.foodSelected,
                                text: "Offer",
                                event: () {
                                  context
                                      .read<HomeFoodTabBloc>()
                                      .add(OfferSelectedEvent());

                                  _homePageController.animateToPage(1, duration: Duration(milliseconds: 700), curve: Curves.easeIn);
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      HomeCustomPageView(
                        pageController: _homePageController,
                      )
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
