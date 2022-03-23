import 'package:flutter/material.dart';
import 'package:sporty_app/Auth/LogIn/ForgetPasswordScreen.dart';

import '../SignUp/SignUpScreen.dart';

class LogInScreen extends StatelessWidget {
  static const ROUTE_NAME="Login screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/welcomeScreen.png",fit: BoxFit.fill,),
            const Text("Welcome Hero, Sign In To Continue",style: TextStyle(fontSize: 14),),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "E-mail",
                labelText: 'E-mail *',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Password",
                labelText: 'Password *',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },
            ),
            InkWell(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ForgetPasswordScreen()));
              },
                child: const Text("Forget Password ?",textAlign: TextAlign.end,)),
            Container(
              width: 296,height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: (){},
                child: const Text("Sign In",style: TextStyle(color: Colors.white),),),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SignUpScreen()));
              },
              child: const Text.rich(
                TextSpan(
                  text: "Don't Have An Account ?", // default text style
                  children: <TextSpan>[
                    TextSpan(text: ' Sign Up ',
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
