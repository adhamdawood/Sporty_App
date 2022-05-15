import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/GetData.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/APIs/GetData.dart';
import 'package:sporty_app/Auth/LogIn/LogInScreen.dart';
import 'package:sporty_app/Home/GetAllData.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

import '../Models/Widgets.dart';

class AllProductsAndTraining extends StatefulWidget {
  @override
  State<AllProductsAndTraining> createState() => _AllProductsAndTrainingState();
}

class _AllProductsAndTrainingState extends State<AllProductsAndTraining> {
  dynamic token = cacheHelper.sharedPreferences.getString("token");
  Future<GetData> getHomeData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData=GetAlLData();
  }
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<GetData>
      (future: getHomeData,
        builder: (buildContext,snapShot){
          if(snapShot.hasError){
            return LogInScreen();
          }else if(snapShot.hasData){
            return getAllData(snapShot.data);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<GetData> GetAlLData() async {
    var body = jsonEncode({
    });
    var url = Uri.parse(
        '${ApiUrl}/api/home');
    final response = await http.get(url,
        headers: {
          "content-type": "application/json",
          "Accept": "application/json",
          "Authorization" : "Bearer $token"
        });
    if (response.statusCode == 200) {
     return await GetData.fromJson(jsonDecode(response.body));
    } else  {
      throw(Exception(response.body));
    }
  }
}
