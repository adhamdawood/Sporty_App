import 'dart:convert';
import 'package:sporty_app/componants/componants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/GetUserDetails.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/modules/ProfileView/CreditCardInfo.dart';
class CreditCardsScreen extends StatefulWidget {
  static const ROUTE_NAME = "Credit cards";
  String creditNumber,zipCode,creditId,mobileNumber;
  String creditExp, firstName, lastName, email;
  CreditCardsScreen({this.creditNumber,this.creditId,this.creditExp,this.zipCode,this.email,this.firstName,this.lastName});
  @override
  State<CreditCardsScreen> createState() => _CreditCardsScreenState();
}

class _CreditCardsScreenState extends State<CreditCardsScreen> {



  Future<GetUserDetails>userDetails;
  void initState() {
    // TODO: implement initState
    super.initState();
    userDetails=getDetails();
  }
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreditCardInformation(firstName: widget.firstName,lastName: widget.lastName,email: widget.email,)));},
                //creditExp: snapShot.data.creditCards.first.expirationDate!=null?snapShot.data.creditCards.first.expirationDate:" ",creditNumber: snapShot.data.creditCards.first.creditCardNumber!=null?snapShot.data.creditCards.first.creditCardNumber:" ",zipCode: snapShot.data.creditCards.first.zipcode!=null?snapShot.data.creditCards.first.zipcode:" "
                child: const Text(
                  "Add Credit", style: TextStyle(color: Colors.white),),),
            ),
          ),
        ],

      ),

    );


    /*FutureBuilder<GetUserDetails>

    (future: userDetails, builder: (buildContext,snapShot){

      if(snapShot.data == null){
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreditCardInformation(firstName: snapShot.data.name.split(' ').first,lastName: snapShot.data.name.split(' ').last,email: snapShot.data.email,)));},
                    //creditExp: snapShot.data.creditCards.first.expirationDate!=null?snapShot.data.creditCards.first.expirationDate:" ",creditNumber: snapShot.data.creditCards.first.creditCardNumber!=null?snapShot.data.creditCards.first.creditCardNumber:" ",zipCode: snapShot.data.creditCards.first.zipcode!=null?snapShot.data.creditCards.first.zipcode:" "
                    child: const Text(
                      "Add Credit", style: TextStyle(color: Colors.white),),),
                ),
              ),
            ],

          ),

        );
      }

      else if(snapShot.data.creditCards.length!=0){
        return CreditCardInformation(creditExp: snapShot.data.creditCards.first.expirationDate,creditNumber: snapShot.data.creditCards.first.creditCardNumber,zipCode: snapShot.data.creditCards.first.zipcode,firstName: snapShot.data.name.split(' ').first,lastName: snapShot.data.name.split(' ').last,email: snapShot.data.email,creditId: snapShot.data.creditCards.first.creditCardId,);}
      else if(snapShot.hasError){
        return Text(snapShot.error.toString());

      }
      else{
        return Center(child: CircularProgressIndicator());
      }

    });*/
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

    final response = await http.get(Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/users/profile'),
        headers:{'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1MzAyM2E1YS1jYTVjLTRhNGQtODUzMC01NmVjZGVkZWRkMzYiLCJlbWFpbCI6ImFobWVkd2FlbC44ODlAZ21haWwuY29tIiwidWlkIjoiYWQ4YzYzZjAtZGNhNC00MmI0LTljZTQtMGU4N2UyYWQwNDVjIiwiZXhwIjoxNjU3NzE3NzExLCJpc3MiOiJUZXN0SldUQXBpIiwiYXVkIjoiVGVzdEpXVEFwaVVzZXIifQ.fnUvVChTZWq5pZ9iYLsrjv1qaEhctvgr7k5pS73s-84'}
    );
    if (response.statusCode == 200) {

      dynamic jsonResponse = json.decode(response.body);
      return GetUserDetails.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Unexpected error occured!');
    }
}


