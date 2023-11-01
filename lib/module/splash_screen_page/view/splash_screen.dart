import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/module/access_page/view/access_page.dart';
import 'package:food_app/module/network_communication/bloc/connectivity_bloc/check_connectivity_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const pageName = "SplashScreen";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late CheckConnectivityBloc checkConnectivityBloc;

  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds and then navigate to the main screen

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 3), () {
        // checkConnectivityBloc =
        //     context.read<CheckConnectivityBloc>();

        // if (checkConnectivityBloc.state is ConnectivityConnectedState) {
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => const AccessPage()),

        //   );
        //   // print("dfsdfsdfsdfsdfsdfsdf");
        // } else if (checkConnectivityBloc.state
        //     is ConnectivityDisconnectedState) {
        //   Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => const AccessPage()),
        //   );
        // }else{
        //  Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => const AccessPage())
        //  );
        // }
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const AccessPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            'assets/images/splash_screen_image.jpg', fit: BoxFit.fill,),
              
      ),
    );
  }
}
