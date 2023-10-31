import 'package:flutter/cupertino.dart';
import 'package:food_app/module/access_page/view/access_page.dart';
import 'package:food_app/module/customer/dashbord/view/dashboard_page.dart';
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
      return CupertinoPageRoute(builder: (context) => const DashboardPage());
  }
  return null;
}