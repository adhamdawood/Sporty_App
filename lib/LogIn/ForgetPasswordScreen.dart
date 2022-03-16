import 'package:flutter/material.dart';
import 'package:sporty_app/LogIn/VerificationCode.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const ROUTE_NAME= "ForgetPassword Screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.black,),
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
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
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
                onPressed: (){
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => VerificationCode()));
                },
                child: const Text("Send Code",style: TextStyle(color: Colors.white),),),
            ),
          ],
        ),
      ),
    );
  }
}
