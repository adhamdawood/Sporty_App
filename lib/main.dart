import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Auth/LogIn/ForgetPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/NewPasswordScreen.dart';
import 'package:sporty_app/Auth/LogIn/VerificationCode.dart';
import 'package:sporty_app/Auth/SignUp/SignUpScreen.dart';
import 'package:sporty_app/Home/HomeScreen.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/Home/chooseInterests.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:sporty_app/WelcomeScreen.dart';

import 'Auth/LogIn/LogInScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await cacheHelper.init();
   dynamic welcome = cacheHelper.getData(key: 'welcome');
  dynamic token = cacheHelper.sharedPreferences.getString("token");
  ShoppingCubit cubit = new ShoppingCubit();
  //cubit.createDatabase();
  //cacheHelperr.createDatabase();
  Widget widget;
  if(welcome!=null){
    if(token!=null){widget=HomePage();}
    else {widget=LogInScreen();}
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
         // initialRoute: HomePage.ROUTE_NAME,
          //welcome==true?WelcomeScreen.ROUTE_NAME:LogInScreen.ROUTE_NAME,
         home: widget,
        );
  }
}

