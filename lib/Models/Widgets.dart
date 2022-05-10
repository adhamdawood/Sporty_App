
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/APIs/newTokenFromResetingPassword.dart';
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';

Widget tabOfSport({String name}){
  bool onClick=true;
    return onClick? Container(
      width: 100,
      height: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(name,style: TextStyle(fontSize: 14,color: Colors.black),)),
    ):Container(
      width: 100,
      height: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xff3f88c5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: Text(name,style: TextStyle(fontSize: 14,color: Colors.white),)),
    );
  }

  Future<bool> flutterToast({String msg}){
  return  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color(0xFFE20030),
      textColor: Colors.white,
      fontSize: 16.0
  );
  }

  Future<bool> checkRefreshToken() async {
  String refreshToken =cacheHelper.sharedPreferences.getString("refreshToken");
  var body = jsonEncode({
    'Token':refreshToken,
  });
  var url = Uri.parse(
      'http://Sporty.somee.com/api/Auth/refreshToken/');
  final response = await http.post(url,
      body: body, headers: {
        "content-type": "application/json",
        "Accept": "application/json",
      });
  if (response.statusCode == 200) {
      NewTokenFromResetingPassword  nEw =await NewTokenFromResetingPassword.fromJson(jsonDecode(response.body));
      cacheHelper.saveData(key: "refreshToken", value: nEw.refreshToken);
    return true;
  } else {
    print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
    return false;
  }
}