import 'package:flutter/material.dart';
import 'package:sporty_app/Auth/LogIn/ForgetPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/NewPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/VerificationCode.dart';
import 'package:sporty_app/Auth/SignUp/SignUpScreen.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardInfo.dart';
import 'package:sporty_app/Home/ProfileView/CreditCards.dart';
import 'package:sporty_app/Home/ProfileView/ProfileInformation.dart';
import 'package:sporty_app/Home/ProfileView/ProfileViewScreen.dart';
import 'package:sporty_app/WelcomeScreen.dart';

import 'Auth/LogIn/LogInScreen.dart';

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
        NewPasswordScreen.ROUTE_NAME:(context)=>NewPasswordScreen(),
        ProfileScreen.ROUTE_NAME:(context)=>ProfileScreen(),
        ProfileInformation.ROUTE_NAME:(context)=>ProfileInformation(),
        CreditCardInformation.ROUTE_NAME: (context)=>CreditCardInformation(),
        CreditCards.ROUTE_NAME: (context)=>CreditCards()

      },
      initialRoute: ProfileScreen.ROUTE_NAME,

    );
  }
}

