import 'package:flutter/material.dart';
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
      },
      initialRoute: WelcomeScreen.ROUTE_NAME,
      home: WelcomeScreen(),

    );
  }
}

