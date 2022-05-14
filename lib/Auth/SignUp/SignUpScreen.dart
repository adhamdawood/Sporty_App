import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/SportProducts/consttt.dart';
import 'package:sporty_app/Models/Widgets.dart';


import '../LogIn/LogInScreen.dart';

class SignUpScreen extends StatefulWidget {

  static const ROUTE_NAME = "SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String firstName,lastName;
  String eMail,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/welcomeScreen.png",fit: BoxFit.fill,),
            Text("Welcome Hero, Sign Up To Join Us",style: TextStyle(fontSize: 14),),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "First Name",
                labelText: 'First Name *',
              ),
              onChanged: (value){
                firstName=value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Last Name",
                labelText: 'Last Name *',
              ),
              onChanged: (value){
                lastName=value;
              },),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "E-mail",
                labelText: 'E-mail *',
              ),
              onChanged: (value){
                eMail=value;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Password",
                labelText: 'Password *',
              ),
             onChanged: (value){
                password=value;
             },
            ),
            Container(
              width: 296,height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: (){
                  if(firstName!=null&&lastName!=null&&password!=null){
                    SignUp();
                  }else{
                   flutterToast(msg: "All Inputs are Required ");
                  }
                },
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

  Future<void> SignUp() async {
    var body = jsonEncode({
      "firstName": firstName,
      "lastName": lastName,
      "email": eMail,
      "password": password,
      "confirmPassword":password,
    });
    var url = Uri.parse(
        '${baseApi}/api/Auth/signup');
    final response = await http.post(url,
        body: body, headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
      flutterToast(msg: "Signed up Successfully");
      Navigator.pushNamed(context, LogInScreen.ROUTE_NAME);
    } else if(response.statusCode==400) {
      flutterToast(msg: "The Email field is not a valid e-mail address");
      throw(Exception(response.body));
    }else {
      flutterToast(msg: response.body.characters.string);
      throw(Exception(response.body));
    }
  }
}
