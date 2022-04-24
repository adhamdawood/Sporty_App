import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/GetUserDetails.dart';
import 'package:sporty_app/Home/ProfileView/CreditCardInfo.dart';
import 'package:http/http.dart' as http;
class CreditCards extends StatefulWidget {
  static const ROUTE_NAME = "Credit cards";

  @override
  State<CreditCards> createState() => _CreditCardsState();
}

class _CreditCardsState extends State<CreditCards> {

  Future<GetUserDetails>userDetails;
  void initState() {
    // TODO: implement initState
    super.initState();
    userDetails=getDetails();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetUserDetails>

    (future: userDetails, builder: (buildContext,snapShot){

      if(snapShot.data.creditCards.isEmpty){
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
                    Image(image: AssetImage("assets/images/hand.png"),
                      width: 250,
                      height: 250,),
                    SizedBox(height: 10,),
                    Text('You have no credit card in your account')
                  ],
                ),
              ),


              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(

                  width: double.infinity, height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE20030),
                    borderRadius: BorderRadius.circular(10),
                  ),


                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                          CreditCardInformation.ROUTE_NAME);
                    },
                    child: const Text(
                      "Add Credit", style: TextStyle(color: Colors.white),),),
                ),
              ),
            ],

          ),

        );
      }
      else if(snapShot.hasError){
        return Text(snapShot.error.toString());}
      else if(snapShot.data.creditCards.isNotEmpty){
        return CreditCardInformation(snapShot.data.creditCards.first.expirationDate,snapShot.data.creditCards.first.creditCardNumber,snapShot.data.creditCards.first.zipcode);}

      else{
        return Center(child: CircularProgressIndicator());
      }

    });
    /*return Scaffold(
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
                Image(image: AssetImage("assets/images/hand.png"),
                  width: 250,
                  height: 250,),
                SizedBox(height: 10,),
                Text('You have no credit card in your account')
              ],
            ),
          ),


          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(

              width: double.infinity, height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFFE20030),
                borderRadius: BorderRadius.circular(10),
              ),


              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                      CreditCardInformation.ROUTE_NAME);
                },
                child: const Text(
                  "Add Credit", style: TextStyle(color: Colors.white),),),
            ),
          ),
        ],

      ),

    );*/
  }
}
  Future<GetUserDetails>getDetails()async {

    final response = await http.get(Uri.parse('http://mohamedsadk889-001-site1.etempurl.com/api/users/profile'),
        headers:{'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiIwMmJhZTM2OC1jODUwLTRhYmMtYTYyNy0xMGUwOWUxYjQ3ZWUiLCJlbWFpbCI6Im1vaGFtZWRzYWRrLjg4OUBnbWFpbC5jb20iLCJ1aWQiOiIxYjk1MmY3Ni04ODAxLTQ2ZjAtYTVjMy0yNWU0NGViNjU0MDQiLCJleHAiOjE2NTIxOTI3NTUsImlzcyI6IlRlc3RKV1RBcGkiLCJhdWQiOiJUZXN0SldUQXBpVXNlciJ9.N6BP4r7QOriMIHT2uyhNLQu0g4CnmECpAriHgI5JGek'}
    );
    if (response.statusCode == 200) {

      dynamic jsonResponse = json.decode(response.body);
      return GetUserDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unexpected error occured!');
    }
}
