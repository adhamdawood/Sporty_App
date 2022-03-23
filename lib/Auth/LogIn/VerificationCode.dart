import 'package:flutter/material.dart';

class VerificationCode extends StatelessWidget {
  static const ROUTE_NAME="verificationCode";

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Verification Code",style: TextStyle(fontWeight: FontWeight.bold),),
            const Text("Enter the code that was sent to",style: TextStyle(fontSize: 14),),
            const Text("The account@gmail.com   ",style: TextStyle(fontSize: 14,color:Color(0xFFE20030),),),
            const SizedBox(height: 100,),

            const Text("Enter your code"),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "",
               // labelText: 'SENT CODE *',
              ),
              onSaved: (String value) {
                // This optional block of code can be used to run
                // code when the user saves the form.
              },
              validator: (String value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
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
                onPressed: (){},
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
}
