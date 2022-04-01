
import 'package:flutter/material.dart';

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