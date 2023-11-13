import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/module/customer/home/bloc/food_tab/home_food_tab_bloc.dart';
import 'package:food_app/module/customer/home/widgets/food_tabs.dart';
import 'package:food_app/module/customer/home/widgets/home_appbar.dart';
import 'package:food_app/module/customer/home/widgets/home_page_view.dart';

class HomeTopPageWidget extends StatelessWidget {
  const HomeTopPageWidget(
      {super.key,
      required,
      required this.animationController,
      required this.scaleAnimation,
      required this.positionAnimation,
      required this.homePageController,
      required this.searchTextEditingController});

  final TextEditingController searchTextEditingController;
  final AnimationController animationController;
  final Animation<double> scaleAnimation;
  final Animation<AlignmentGeometry> positionAnimation;
  final PageController homePageController;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.3, 0))
              .animate(animationController),
      child: ScaleTransition(
        scale: scaleAnimation,
        child: GestureDetector(
          onTap: () {
            if (animationController.status == AnimationStatus.completed) {
              animationController.reverse();
            }
          },
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                HomeAppBar(drawerAnimationController: animationController),
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

                            homePageController.animateToPage(0,
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

                            homePageController.animateToPage(1,
                                duration: const Duration(milliseconds: 700),
                                curve: Curves.easeIn);
                          },
                        ),
                      ],
                    );
                  },
                ),
                HomeCustomPageView(
                  pageController: homePageController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
