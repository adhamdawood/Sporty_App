import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/OrderDetails.dart';
import 'package:sporty_app/Home/ProfileView/OrderButtonStyle.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/Shared_preferences/Cache_Helper.dart';
class OrderHistory extends StatefulWidget{

  static const ROUTE_NAME = "Order history";

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  Future<List<OrderDetails>>orderDetail;
  List<OrderDetails>allOrders;
  void initState() {
    // TODO: implement initState
    super.initState();
    orderDetail=orderDetails();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OrderDetails>>

    (future: orderDetail, builder: (buildContext,snapShot){
      if(snapShot.hasData){
        List<OrderDetails>orderData=snapShot.data;
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
          backgroundColor: Colors.white,
    title: Text(
    'Orders history',
    style: TextStyle(color: Colors.black),
    ),),
      body:ListView.builder(itemBuilder: (buildContext,index){
        return OrderButtonStyle(orderData[index].address.city,orderData[index].address.street,orderData[index].date,orderData[index].productsDetails.length,orderData[index].totalPrice,index,orderData[index].productsDetails,orderData[index].creditCardNumber);},
        itemCount:orderData.length,


      )
    );
    }
      else if(snapShot.hasError){
        if(snapShot.data==null)
          return Scaffold(
            body: Center(child: Text("You should place an order first")),
          );
        else
        return Text(snapShot.error.toString());}
      else{
        return Center(child: Scaffold(backgroundColor: Colors.white,body: Center(child: CircularProgressIndicator(),),));
      }
        }
);

  }

  Future <List<OrderDetails>>orderDetails()async {

    final response = await http.get(Uri.parse('http://ahmedssaleem-001-site1.etempurl.com/api/orders/history'),
        headers: { 'Authorization':
        'Bearer ${cacheHelper.sharedPreferences.getString("token")}' });
    if (response.statusCode == 200) {

      List jsonResponse = json.decode(response.body);
     allOrders= jsonResponse.map((data) => OrderDetails.fromJson(data)).toList();

      return allOrders;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
