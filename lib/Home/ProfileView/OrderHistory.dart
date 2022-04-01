import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  static const ROUTE_NAME = "Order history";

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
      body: ListView(
        children: [
          Column(

          )
        ],

      ),

    );
  }
}
