import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/module/customer/home/bloc/home_food_tab_bloc.dart';
import 'package:food_app/module/network_communication/bloc/connectivity_bloc/check_connectivity_bloc.dart';
import 'package:food_app/module/splash_screen_page/view/splash_screen.dart';
import 'package:food_app/navigation/app_navigation.dart';

//background color
// Color.fromARGB(255, 4, 23, 38)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CheckConnectivityBloc()..add(NetworkObserverEvent()),
        ),

        // home module
        
        BlocProvider(
          create: (context) => HomeFoodTabBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.pageName,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
