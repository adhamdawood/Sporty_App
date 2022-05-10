import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/GetHomeData.dart';
import 'package:sporty_app/APIs/get_all_sports.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Home/GetAllData.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

class AllProductsAndTraining extends StatefulWidget {
  @override
  State<AllProductsAndTraining> createState() => _AllProductsAndTrainingState();
}

class _AllProductsAndTrainingState extends State<AllProductsAndTraining> {
  dynamic token = cacheHelper.sharedPreferences.getString("token");
  Future<GetHomeData> getHomeData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHomeData=GetAlLData();
  }
  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<GetHomeData>
      (future: getHomeData,
        builder: (buildContext,snapShot){
          if(snapShot.hasError){
            return Text(snapShot.error.toString());
          }else if(snapShot.hasData){
            return getAllData(snapShot.data);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Future<GetHomeData> GetAlLData() async {

    var body = jsonEncode({
    });
    var url = Uri.parse(
        'http://Sporty.somee.com/api/home');
    final response = await http.get(url,
        headers: {
          "content-type": "application/json",
          "Accept": "application/json",
          "Authorization" : "Bearer $token"
        });
    if (response.statusCode == 200) {
      return await GetHomeData.fromJson(jsonDecode(response.body));
    } else  {
      throw(Exception(response.body));
    }
  }
}
