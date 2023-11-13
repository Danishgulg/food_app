
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/module/customer/home/widgets/drawer.dart';
import 'package:food_app/module/customer/home/widgets/top_homepage_widget.dart';

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
          // drawer

          const DrawerWidget(),

          // top page

          HomeTopPageWidget(
            animationController: _animationController,
            homePageController: _homePageController,
            scaleAnimation: _scaleAnimation,
            positionAnimation: _positionAnimation,
            searchTextEditingController: _searchTextEditingController,
          )
        ],
      ),
    );
  }
}

