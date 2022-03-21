import 'package:flutter/material.dart';
import 'package:sporty_app/LogIn/LogInScreen.dart';

class SignUpScreen extends StatelessWidget {

  static const ROUTE_NAME = "SignUpScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/welcomeScreen.png",fit: BoxFit.fill,),
            const Text("Welcome Hero, Sign Up To Join Us",style: TextStyle(fontSize: 14),),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "First Name",
                labelText: 'First Name *',
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
            hintText: "Last Name",
            labelText: 'Last Name *',
          ),
          onSaved: (String value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: (String value) {
            return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
          },),
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
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Confirm Password",
                labelText: 'Confirm Password *',
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
