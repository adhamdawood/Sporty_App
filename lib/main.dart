import 'dart:convert';

import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:sporty_app/APIs/ProgramDetails.dart';
>>>>>>> da033a8b5570aee6d7944d61a95cefc8bb10330d
import 'package:sporty_app/Auth/LogIn/ForgetPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/NewPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/VerificationCode.dart';
import 'package:sporty_app/Auth/SignUp/SignUpScreen.dart';
<<<<<<< HEAD
import 'package:sporty_app/Home/HomeScreen.dart';
import 'package:sporty_app/Home/chooseInterests.dart';
import 'package:sporty_app/Models/Widgets.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
=======
import 'package:sporty_app/Home/ProfileView/BookingHistory.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardInfo.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardsScreen.dart';
import 'package:sporty_app/Home/ProfileView/OrderHistory.dart';
import 'package:sporty_app/Home/ProfileView/OrderInformation.dart';
import 'package:sporty_app/Home/ProfileView/ProfileInformation.dart';
import 'package:sporty_app/Home/ProfileView/ProfileViewScreen.dart';
>>>>>>> da033a8b5570aee6d7944d61a95cefc8bb10330d
import 'package:sporty_app/WelcomeScreen.dart';
import 'Auth/LogIn/LogInScreen.dart';

<<<<<<< HEAD
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
=======
void main() {
  runApp( MyApp());
>>>>>>> da033a8b5570aee6d7944d61a95cefc8bb10330d
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
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
=======
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
        CreditCardsScreen.ROUTE_NAME: (context)=>CreditCardsScreen(),
        CreditCardInformation.ROUTE_NAME: (context)=>CreditCardInformation(),
        OrderHistory.ROUTE_NAME: (context)=>OrderHistory(),
        OrderInformation.ROUTE_NAME: (context)=>OrderInformation(),
        BookingHistory.ROUTE_NAME: (context)=>BookingHistory()

      },
      initialRoute: ProfileScreen.ROUTE_NAME,

    );
>>>>>>> da033a8b5570aee6d7944d61a95cefc8bb10330d
  }

}

