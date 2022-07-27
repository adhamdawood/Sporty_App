import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sporty_app/APIs/GetUserDetails.dart';
import 'package:sporty_app/componants/componants.dart';
import 'package:sporty_app/APIs/ProgramDetails.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
import 'package:sporty_app/modules/Auth/LogIn/LogInScreen.dart';
import 'package:sporty_app/modules/ProfileView/BookingHistory.dart';
import 'package:sporty_app/modules/ProfileView/CreditCardInfo.dart';
import 'package:sporty_app/modules/ProfileView/CreditCardsScreen.dart';
import 'package:sporty_app/modules/ProfileView/OrderHistory.dart';
import 'package:sporty_app/modules/ProfileView/ProfileInformation.dart';


class ProfileScreen extends StatefulWidget {
  static const ROUTE_NAME = "Profile screen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<GetUserDetails>userDetails;
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userDetails=getDetails();
    });

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GetUserDetails>

    (future: userDetails, builder: (buildContext,snapShot){
      if(snapShot.hasData){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),

        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: SizedBox(
              width: 70,
              height: 70,
              child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/ManWithHead.png")),
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 3.0),
            child: Text(
              snapShot.data.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Text(
            snapShot.data.email,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 14),
          ),
          SizedBox(
            height: 33,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {   if(snapShot.data.address==null){
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>ProfileInformation(firstName: snapShot.data.name.split(' ').first,lastName: snapShot.data.name.split(' ').last,email: snapShot.data.email))).then((_) {setState(() {
                   userDetails=getDetails();
                      });});
                    }
                    else
                      {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProfileInformation(firstName: snapShot.data.name.split(' ').first,lastName: snapShot.data.name.split(' ').last,email: snapShot.data.email,street: snapShot.data.address.street,city: snapShot.data.address.city,bNumber: snapShot.data.address.buildingNumber, mobileNumber: snapShot.data.address.mobileNumber,))).then((_) {setState(() {
                          userDetails=getDetails();
                        });});
                      }},
                    icon: Row(
                      children: [
                        Icon(Icons.person,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Profile information'))
                      ],
                    ))),
          ),
    SizedBox(
    height: 15,
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {
                      if(snapShot.data.creditCards.length == 0){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreditCardsScreen(firstName: snapShot.data.name.split(' ').first,lastName: snapShot.data.name.split(' ').last,email: snapShot.data.email)));

                      }
                      else{
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CreditCardInformation(firstName: snapShot.data.name.split(' ').first,lastName: snapShot.data.name.split(' ').last,email: snapShot.data.email,creditNumber: snapShot.data.creditCards.first.creditCardNumber,creditExp: snapShot.data.creditCards.first.expirationDate,zipCode: snapShot.data.creditCards.first.zipcode,creditId: snapShot.data.creditCards.first.creditCardId,)));
                      }
                      },
                    icon: Row(
                      children: [
                        Icon(Icons.credit_card,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Credit card'))
                      ],
                    ))),
          ),

    SizedBox(
    height: 15,
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(OrderHistory.ROUTE_NAME);
                    },
                    icon: Row(
                      children: [
                        Icon(Icons.history,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Order history'))
                      ],
                    ))),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(BookingHistory.ROUTE_NAME);
                    },
                    icon: Row(
                      children: [
                        Icon(Icons.history_edu_sharp, color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Booking history'))
                      ],
                    ))),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: .2)),
                width: 400,
                height: 55,
                child: IconButton(
                    onPressed: () {
      cacheHelper.removeData(key: "token").then((value) {
              if(value){
                 Navigator.pushNamed(context,LogInScreen.ROUTE_NAME);
               }
               cacheHelper.removeData(key: "refreshToken");
             });
                    },
                    icon: Row(
                      children: [
                        Icon(Icons.logout,color: const Color(0xFF3f88c5)),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(child: Text('Log out'))
                      ],
                    ))),
          )
        ],
      ),
    );
  }
      else if(snapShot.hasError){
        return Text(snapShot.error.toString());}
      else{
        return Center(child: Scaffold(backgroundColor: Colors.white,body: Center(child: CircularProgressIndicator(),),));
      }
    });}

  Future<GetUserDetails>getDetails()async {
    final response = await http.get(Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/users/profile'),
        headers:{'Authorization':'Bearer ${cacheHelper.sharedPreferences.getString("token")}'}
    );
    if (response.statusCode == 200) {

      dynamic jsonResponse = json.decode(response.body);
      return GetUserDetails.fromJson(jsonDecode(response.body));
    } else {
      flutterToast(msg: "No internet connection!");
      throw Exception('Unexpected error occured!');
    }
  }
}
