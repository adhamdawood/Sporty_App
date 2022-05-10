import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sporty_app/Auth/LogIn/ForgetPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/NewPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/VerificationCode.dart';
import 'package:sporty_app/Auth/SignUp/SignUpScreen.dart';
import 'package:sporty_app/Home/HomeScreen.dart';
import 'package:sporty_app/Home/chooseInterests.dart';
import 'package:sporty_app/Models/Widgets.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:sporty_app/WelcomeScreen.dart';
import 'Auth/LogIn/LogInScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await cacheHelper.init();
   dynamic welcome = cacheHelper.sharedPreferences.getBool("welcome");
  dynamic token = cacheHelper.sharedPreferences.getString("token");
  Widget widget;
  if(welcome == false){
      if(token!=null)
      {
        widget=HomePage();
      }else{
        widget=LogInScreen();
      }
  }else{
    widget=WelcomeScreen();
  }
  runApp( MyApp(widget: widget,));
}

class MyApp extends StatelessWidget {
Widget widget;
  MyApp({this.widget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            chooseInterests.ROUTE_NAME:(context)=>chooseInterests(),
            HomePage.ROUTE_NAME:(context)=>HomePage(),
          },
         // initialRoute: ForgetPasswordScreen.ROUTE_NAME,
          //welcome==true?WelcomeScreen.ROUTE_NAME:LogInScreen.ROUTE_NAME,
         home: widget,
        );
  }

}

