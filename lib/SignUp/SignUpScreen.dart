import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static const ROUTE_NAME = "SignUpScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/welcomeScreen.png",fit: BoxFit.fill,),
            const Text("Welcome Hero, Sign Up To Join Us",style: TextStyle(fontSize: 14),),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Full Name",
                labelText: 'Full Name *',
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
            const SizedBox(height: 10,),
            Container(
              width: 296,height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: (){},
                child: const Text("Sign Up",style: TextStyle(color: Colors.white),),),
            ),
            const Text.rich(
              TextSpan(
                text: "Already have an account ?", // default text style
                children: <TextSpan>[
                  TextSpan(text: ' Sign In ',
                    style: TextStyle(color :Color(0xFFE20030),fontWeight: FontWeight.bold ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
