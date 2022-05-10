import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/APIs/CheckResetToken.dart';
import 'package:sporty_app/Auth/LogIn/NewPasswordScreen.dart';
import 'package:sporty_app/Models/Widgets.dart';

class VerificationCode extends StatefulWidget {
  static const ROUTE_NAME="verificationCode";
  String eMail;
  VerificationCode({this.eMail});

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  String verificationCode;
  CheckResetToken resetToken;
  String newUrl;
  bool urlIsSent=false;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Verification Code",style: TextStyle(fontWeight: FontWeight.bold),),
            const Text("Enter the code that was sent to",style: TextStyle(fontSize: 14),),
             Text( widget.eMail,style: const TextStyle(fontSize: 14,color:Color(0xFFE20030),),),
            const SizedBox(height: 100,),

            const Text("Enter your code"),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "",
               // labelText: 'SENT CODE *',
              ),
             onChanged: (value){
                verificationCode=value;
             },
            ),
            //const SizedBox(height: 20,),
            Container(
              width: 296,height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed :() async {
                  await verifyCode();
                  if(urlIsSent){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => NewPasswordScreen(newUrl: newUrl,)));
                  }

                },
                child: const Text("Reset Password",style: TextStyle(color: Colors.white),),),
            ),
            //const SizedBox(height: 20,),
            const Text.rich(
              TextSpan(
                text: "Don't Receive Code ?", // default text style
                children: <TextSpan>[
                  TextSpan(text: ' Resend Code ',
                    style: TextStyle(color :Color(0xFFE20030),fontWeight: FontWeight.bold ),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<CheckResetToken> verifyCode() async {
    var body = jsonEncode({
      'Token': verificationCode,
    });
    var url = Uri.parse(
        'http://Sporty.somee.com/api/Auth/CheckResetToken');
    final response = await http.post(url,
        body: body, headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
       resetToken = await CheckResetToken.fromJson(jsonDecode(response.body));
       newUrl=resetToken.resetLink.href;
     urlIsSent=true;
    } else if(response.statusCode==403){
      urlIsSent=false;
      flutterToast(msg: "Invalid code");
      throw(Exception(response.body));
    }else{
      urlIsSent=false;
      flutterToast(msg: "code is required!");
    }
  }
}
