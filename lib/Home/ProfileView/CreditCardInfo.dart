import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sporty_app/APIs/GetUserDetails.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/ProfileView/ProfileViewScreen.dart';
class CreditCardInformation extends StatefulWidget {
  static const ROUTE_NAME = "Credit card info";
  String creditNumber,zipCode,creditId,creditExp;
  String  firstName, lastName, email;



  Future<GetUserDetails> userDetails;
CreditCardInformation({this.creditExp,this.creditNumber,this.zipCode,this.userDetails,this.firstName,this.lastName,this.email,this.creditId});

  @override
  State<CreditCardInformation> createState() => _CreditCardInformationState();

}

class _CreditCardInformationState extends State<CreditCardInformation> {
  Future<GetUserDetails> userDetails;
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
          SizedBox(height: 15,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                initialValue: widget.creditNumber,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Credit card number',
                    labelStyle: TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    setState(() {
                      widget.creditNumber = value;
                    });
                  }
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                initialValue: widget.zipCode,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'ZIP code',
                    labelStyle: TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    setState(() {
                      widget.zipCode = value;
                    });
                  }
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                initialValue: widget.creditExp,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Expiration date',
                    labelStyle: TextStyle(color: Colors.grey)),
                  onChanged: (value) {
                    setState(() {
                      widget.creditExp = value;
                    });
                  }
              )),

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
                onPressed: (){
                  if(widget.creditNumber==""||widget.creditExp== "" ||
                      widget.zipCode==""


                  ) return Fluttertoast.showToast(
                      msg: "Please insert the credit card details correctly",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor:  const Color(0xFFE20030),
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  setState(() {
                    updateAlbum(widget.firstName,widget.lastName,widget.email,widget.creditExp,widget.creditNumber,widget.zipCode,widget.creditId);
                  });
                  Navigator.of(context).pushReplacementNamed(ProfileScreen.ROUTE_NAME);

                },
                child: const Text("Update",style: TextStyle(color: Colors.white),),),
            ),
          ),
        ],

      ),

    );
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

  Future<GetUserDetails> updateAlbum(String firstName, String lastName,
      String email, String creditExp, String creditNumber, String zipCode, String creditId) async {
    print("in api: ${firstName}");
    final response = await http.put(
      Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/users/profile'),
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI1MzAyM2E1YS1jYTVjLTRhNGQtODUzMC01NmVjZGVkZWRkMzYiLCJlbWFpbCI6ImFobWVkd2FlbC44ODlAZ21haWwuY29tIiwidWlkIjoiYWQ4YzYzZjAtZGNhNC00MmI0LTljZTQtMGU4N2UyYWQwNDVjIiwiZXhwIjoxNjU3NzE3NzExLCJpc3MiOiJUZXN0SldUQXBpIiwiYXVkIjoiVGVzdEpXVEFwaVVzZXIifQ.fnUvVChTZWq5pZ9iYLsrjv1qaEhctvgr7k5pS73s-84',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: widget.creditId==null?jsonEncode({'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'creditCard': [{'creditCardNumber': creditNumber, 'expirationDate': creditExp, 'zipcode': zipCode}]})
          :jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
    'creditCard': [{"creditCardId": creditId,
      'creditCardNumber': creditNumber, 'expirationDate': creditExp, 'zipcode': zipCode}]}

      //String creditCardNumber,
      //       String expirationDate,
      //       String zipcode
    ));
   /*
    Future<GetUserDetails> updateAlbum(String firstName, String lastName,
        String email, String creditExp, String creditNumber, String zipCode) async {
      final response = await http.put(
        Uri.parse('http://Sporty.somee.com/api/users/profile'),
        headers: {
          'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI3ZDgxMmNmMi05MjNiLTRjZDgtYTU4MS1kYjdkYzBiNjJlY2UiLCJlbWFpbCI6Im1vaGFtZWRzYWRrLjg4OUBnbWFpbC5jb20iLCJ1aWQiOiJlMTRhMGYxZS04MmUzLTRiN2EtYjVkMi05OTgxZjcyMmE0YzEiLCJleHAiOjE2NTcyMjQ0MDQsImlzcyI6IlRlc3RKV1RBcGkiLCJhdWQiOiJUZXN0SldUQXBpVXNlciJ9.nqe9L2ViJ6QAGEj9K7ntDZ4JYzDmQp4SRgBJJYBjuXM',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'creditCard': [{'creditCardNumber': creditNumber, 'expirationDate': creditExp, 'zipcode': zipCode}]
        }),
         updateAlbum(widget.firstName,widget.lastName,widget.email,widget.creditExp,widget.creditNumber,widget.zipCode);
        //String creditCardNumber,
        //       String expirationDate,
        //       String zipcode
      );*/
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return GetUserDetails.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }
}
