import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  static const ROUTE_NAME = "Profile info";

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
    );
  }
}
