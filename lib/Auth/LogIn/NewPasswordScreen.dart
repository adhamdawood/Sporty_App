import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/newTokenFromResetingPassword.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Auth/LogIn/LogInScreen.dart';
import 'package:sporty_app/componants/componants.dart';

class NewPasswordScreen extends StatefulWidget {
  static const ROUTE_NAME="NewPasswordScreen";
  String newUrl;
  NewPasswordScreen({this.newUrl});
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  String newPassword,confirmNewPassword;
  NewTokenFromResetingPassword newTokenFromResetPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.black,),
          onPressed:() => Navigator.pop(context),
        ),),
      body : Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/images/key.png",fit: BoxFit.fill,),
            const Text("Forget Password ?",style: TextStyle(fontWeight: FontWeight.bold),),
            const Text("Enter your email to reset the password",style: TextStyle(fontSize: 14),),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Password",
                labelText: 'Password *',
              ),
            onChanged: (value){
                newPassword=value;
            },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "ConfirmPassword",
                labelText: 'ConfirmPassword *',
              ),
              onChanged: (value){
                confirmNewPassword=value;
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
                  if(newPassword==confirmNewPassword){
                    creatingNewPassword();
                  }
                  else{
                    flutterToast(msg: "the passwords aren't the same");
                  }
                },
                child: const Text("Create password",style: TextStyle(color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> creatingNewPassword() async {
    var body = jsonEncode({
      "newPassword": newPassword,
      "confirmPassword": confirmNewPassword,
    });
    var url = Uri.parse(widget.newUrl);
    final response = await http.post(url,
        body: body, headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
       flutterToast(msg: "The new password is reset Successfully");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => LogInScreen()));
    } else {
      flutterToast(msg: "Something went wrong, Invalid token.");
      throw(Exception(response.body));
    }
  }
}
