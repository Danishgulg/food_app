import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/data/colors/app_color.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/module/customer/home/bloc/food_data/food_data_bloc.dart';
import 'package:food_app/module/customer/home/bloc/food_tab/home_food_tab_bloc.dart';
import 'package:food_app/module/customer/sign_up/bloc/PasswordField/password_field_bloc.dart';
import 'package:food_app/module/customer/sign_up/bloc/check_password/check_password_field_bloc.dart';
import 'package:food_app/module/customer/sign_up/bloc/save_credentials/save_cradentials_bloc.dart';
import 'package:food_app/module/network_communication/bloc/connectivity_bloc/check_connectivity_bloc.dart';
import 'package:food_app/module/splash_screen_page/view/splash_screen.dart';
import 'package:food_app/navigation/app_navigation.dart';

//background color
// Color.fromARGB(255, 4, 23, 38)

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        ),

        //siging module
        BlocProvider(
          create: (context) => CheckPasswordFieldBloc(),
        ),

        BlocProvider(
          create: (context) => PasswordFieldBloc(),
        ),

        BlocProvider(
          create: (context) => SaveCradentialsBloc(),
        ),

        //home page food tab

        BlocProvider( 
          create: (context) => FoodDataBloc(),
        ),
        BlocProvider(
          create: (context) => HomeFoodTabBloc(),
        ),
      ],
      child: ProviderScope(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
              useMaterial3: true,
              textSelectionTheme: const TextSelectionThemeData(
                cursorColor: AppColor.cursorColor,
                selectionColor: AppColor.cursorColor,
                selectionHandleColor: AppColor.cursorColor,
              ),
              inputDecorationTheme: InputDecorationTheme(
                fillColor: AppColor.textFieldBackColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
              buttonTheme:
                  const ButtonThemeData(buttonColor: AppColor.buttonColor)),
          initialRoute: SplashScreen.pageName,
          onGenerateRoute: generateRoute,
        ),
      ),
    );
  }
}
