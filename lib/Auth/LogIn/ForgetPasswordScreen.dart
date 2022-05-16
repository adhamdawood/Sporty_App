import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Auth/LogIn/VerificationCode.dart';
import 'package:sporty_app/Home/SportProducts/consttt.dart';

import '../../Models/Widgets.dart';


class ForgetPasswordScreen extends StatefulWidget {
  static const ROUTE_NAME= "ForgetPassword Screen";

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String eMail;
 bool codeIsSent;

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
            Image.asset("assets/images/ForgetPassword.png",fit: BoxFit.fill,),
            const Text("Forget Password ?",style: TextStyle(fontWeight: FontWeight.bold),),
            const Text("Enter your email to reset the password",style: TextStyle(fontSize: 14),),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "E-mail",
                labelText: 'E-mail *',
              ),
             onChanged: (value){
                eMail=value;
             },
              validator: (String value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },
            ),
            Container(
              width: 296,height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () async {
                   await forgetPass();
                  if(codeIsSent){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => VerificationCode(eMail: eMail,)));
                  }
                 },
                child: const Text("Send Code",style: TextStyle(color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> forgetPass() async {
    var url = Uri.parse(
        '${ApiUrl}/api/Auth/ForgetPassword?email=$eMail');
    final response = await http.post(url,
         headers: {
          "content-type": "application/json",
          "Accept": "application/json",
        });
    if (response.statusCode == 200) {
        flutterToast(msg: "Reset password Token has been sent to your email successfully!");
        codeIsSent= true;
    } else {
      flutterToast(msg: response.body.characters.string);
      codeIsSent= false;
    }
  }
}
