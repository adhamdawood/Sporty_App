import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/GetUserDetails.dart';
import 'package:http/http.dart' as http;

class ProfileInformation extends StatefulWidget {
  static const ROUTE_NAME = "Profile info";

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
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
        if(snapShot.hasData){
          return
            Scaffold(
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
                  'Profile information',
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
                        initialValue: snapShot.data.name,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'Name',
                            labelStyle: TextStyle(color: Colors.grey)),
                      )),

                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.email,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.grey)),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.address.city,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                            labelText: 'City',
                            labelStyle: TextStyle(color: Colors.grey)),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.address.street,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),

                            labelText: 'Street',
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      )
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: TextFormField(
                        initialValue: snapShot.data.address.buildingNumber.toString(),
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)
                            ),

                            labelText: 'Building',
                            labelStyle: TextStyle(color: Colors.grey)
                        ),
                      )
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
                        onPressed: (){},
                        child: const Text("Update",style: TextStyle(color: Colors.white),),),
                    ),
                  ),
                ],

              ),
            );
    }
        else if(snapShot.hasError){
          return Text(snapShot.error.toString());}
        else{
          return Center(child: CircularProgressIndicator());
        }
      });}
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
          'Profile information',
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
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'First name',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'Last name',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    labelText: 'City',
                    labelStyle: TextStyle(color: Colors.grey)),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),

                    labelText: 'Street',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),

                    labelText: 'Building',
                    labelStyle: TextStyle(color: Colors.grey)
                ),
              )
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
                onPressed: (){},
                child: const Text("Update",style: TextStyle(color: Colors.white),),),
            ),
          ),
        ],

      ),
    );*/

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





