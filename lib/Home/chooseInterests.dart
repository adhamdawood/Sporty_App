import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/get_all_sports.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Models/Widgets.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

class chooseInterests extends StatefulWidget {
  static String ROUTE_NAME="chooseInterests";

  @override
  State<chooseInterests> createState() => _chooseInterestsState();
}
class _chooseInterestsState extends State<chooseInterests> {
  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    getAllSports();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xfff7f7f7),
        height: double.infinity,
        width: double.infinity,
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Choose your Intersts",style: TextStyle(color: Color(0xff1C3144),fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                      onTap: (){},
                      child: tabOfSport(name: "Gym")),
                  tabOfSport(name: "Swimming"),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tabOfSport(name: "FootBall"),
                  tabOfSport(name: "Tennis"),
                ],
              ),
            ],
          ),
        ),
      );
  }

  /*
  * TextButton(
              onPressed: (){
                cacheHelper.removeData(key: "token").then((value) {
                  if(value){
                    Navigator.pushNamed(context,LogInScreen.ROUTE_NAME);
                  }
                });
              },
              child: Text("sign out"),
            ),
            *  return DefaultTabController(
                length: 4,
                child:TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    tabs: allSports.map((deta) =>  tabOfSport(allSports.indexOf(deta))).toList()),
              );*/
  Future<GetAllSports> getAllSports() async {
    var url = Uri.parse(
        'http://mohamedsadk889-001-site1.etempurl.com/api/sports');
    String token ="Bearer ${cacheHelper.sharedPreferences.getString("token")}";
    final response = await http.get(url,
         headers: {
          "Authorization" : token,
          "content-type": "application/json",
        "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      return await GetAllSports.fromJson(jsonDecode(response.body));
    } else{
      throw(Exception(response.body));
    }
  }
}
