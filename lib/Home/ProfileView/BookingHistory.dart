import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/APIs/ProgramDetails.dart';
import 'package:sporty_app/Home/ProfileView/ProgramHistoryDesign.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
class BookingHistory extends StatefulWidget {
  static const ROUTE_NAME = "Booking history";

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  Future<List<ProgramDetails>>programDetail;
  List<ProgramDetails>allPrograms;
  void initState() {
    // TODO: implement initState
    super.initState();
    programDetail=programDetails();
    print(programDetail.toString().length);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProgramDetails>>

      (future: programDetail, builder: (buildContext, snapShot) {
      if (snapShot.hasData) {
        List<ProgramDetails>orderData = snapShot.data;
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
              backgroundColor: Colors.white,
              title: Text(
                'training history',
                style: TextStyle(color: Colors.black),
              ),),
            body: ListView.builder(itemBuilder: (buildContext, index) {
              return ProgramHistoryDesign(image: allPrograms[index].imageUrl,price: allPrograms[index].pricePerMonth,name: "${allPrograms[index].name.substring(0, 20)}...",level: allPrograms[index].level,date: allPrograms[index].date);
            },
              itemCount: allPrograms.length,


            )
        );
      }
      else if(snapShot.hasError){
        if(snapShot.data==null)
          return Scaffold(
            body: Center(child: Text("You should enroll to a program first")),
          );
        else
        return Text(snapShot.error.toString());}
      else{
        return Center(child: Scaffold(backgroundColor: Colors.white,body: Center(child: CircularProgressIndicator(),),));
      }
    }
    );
  }



  Future <List<ProgramDetails>>programDetails()async {

    final response = await http.get(Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/programs/history'),
        headers: { 'Authorization':
        'Bearer ${cacheHelper.sharedPreferences.getString("token")}'});
    if (response.statusCode == 200) {

      List jsonResponse = json.decode(response.body);
      allPrograms= jsonResponse.map((data) => ProgramDetails.fromJson(data)).toList();

      return allPrograms;
    } else {
      throw Exception('${response.statusCode}, ${response.body}');
    }
  }
}
