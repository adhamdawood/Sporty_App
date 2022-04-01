import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardInfo.dart';

class CreditCards extends StatelessWidget {
  static const ROUTE_NAME = "Credit cards";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Credit card',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(

        children: [
          Center(
            child: Column(
              children: [
                SizedBox(height: 88,),
                Image(image: AssetImage("assets/images/hand.png"),width: 250,height: 250,),
                SizedBox(height: 10,),
                Text('You have no credit card in your account')
              ],
            ),
          ),


          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(

              width: double.infinity,height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),


              child: TextButton(
                onPressed: (){Navigator.of(context).pushNamed(CreditCardInformation.ROUTE_NAME);},
                child: const Text("Add Credit",style: TextStyle(color: Colors.white),),),
            ),
          ),
        ],

      ),

    );
  }
}
