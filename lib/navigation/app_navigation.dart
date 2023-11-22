import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/data/constants/firebase_firestore_constants.dart';
import 'package:food_app/module/access_page/view/access_page.dart';
import 'package:food_app/module/customer/main_screen/view/dashboard_page.dart';
import 'package:food_app/module/customer/home/bloc/food_data/food_data_bloc.dart';
import 'package:food_app/module/customer/home/view/home_page.dart';
import 'package:food_app/module/customer/sign_in/view/sign_in_page.dart';
import 'package:food_app/module/customer/sign_up/view/sign_up_page.dart';
import 'package:food_app/module/splash_screen_page/view/splash_screen.dart';

Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.pageName:
      return CupertinoPageRoute(builder: (context) => const SplashScreen());

    case AccessPage.pageName:
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SplashScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            const AccessPage(),
      );
    case DashboardPage.pageName:
      return CupertinoPageRoute(builder: (context) {
        context
            .read<FoodDataBloc>()
            .add(const FetchFoodDataAddEvent(FirebaseFirestoreConstants.burgerFood));

        return const DashboardPage();
      });
    case HomePage.pageName:
      return CupertinoPageRoute(builder: (context) {
        context
            .read<FoodDataBloc>()
            .add(const FetchFoodDataAddEvent(FirebaseFirestoreConstants.burgerFood));

        return const HomePage();
      });

    case SignInPage.pageName:
      return CupertinoPageRoute(builder: (context) => const SignInPage());

    case SignUpPage.pageName:
      return CupertinoPageRoute(builder: (context) => const SignUpPage());
  }
  return null;
}
