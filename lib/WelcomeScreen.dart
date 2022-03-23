import 'package:flutter/material.dart';
import 'package:sporty_app/Auth/LogIn/LogInScreen.dart';
import 'package:sporty_app/Auth/SignUp/SignUpScreen.dart';
class WelcomeScreen extends StatelessWidget {
  static const  ROUTE_NAME ="WelcomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 124,),
              Image.asset("assets/images/welcomeScreen.png",fit: BoxFit.fill,),
              const SizedBox(height: 250,),
              Container(
                width: 296,height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFE20030),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => SignUpScreen()));
                  },
                  child: const Text("Sign Up",style: TextStyle(color: Colors.white),),),
              ),
              const SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => LogInScreen()));
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Already have an account ?", // default text style
                    children: <TextSpan>[
                      TextSpan(text: ' Sign In ',
                        style: TextStyle(color :Color(0xFFE20030),fontWeight: FontWeight.bold ),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

}
