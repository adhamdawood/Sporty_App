import 'package:flutter/material.dart';
import 'package:sporty_app/LogIn/ForgetPasswordScreen.dart';
import 'package:sporty_app/LogIn/LogInScreen.dart';
import 'package:sporty_app/LogIn/VerificationCode.dart';
import 'package:sporty_app/SignUp/SignUpScreen.dart';
import 'package:sporty_app/WelcomeScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      routes: {
        WelcomeScreen.ROUTE_NAME: (context)=>WelcomeScreen(),
        SignUpScreen.ROUTE_NAME:(context)=>SignUpScreen(),
        LogInScreen.ROUTE_NAME:(context)=>LogInScreen(),
        ForgetPasswordScreen.ROUTE_NAME:(context)=>ForgetPasswordScreen(),
        VerificationCode.ROUTE_NAME:(context)=>VerificationCode(),
      },
      initialRoute: WelcomeScreen.ROUTE_NAME,

    );
  }
}

