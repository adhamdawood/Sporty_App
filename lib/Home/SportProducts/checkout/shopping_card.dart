import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sporty_app/Home/SportProducts/checkout/checkout.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({Key key}) : super(key: key);

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading:IconButton(icon :Icon(Icons.arrow_back_ios,
          color: Colors.black,) , onPressed: (){  Navigator.pop(context);},),
        title:Row(
          children: [
            Text('Shopping Card',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),),

          ],
        ),

      ),
      body: Column(
        children: [
       Expanded(
         child: ListView.separated(
            itemBuilder: (context, index) => Column(
    children: [
    Padding(
    padding: const EdgeInsetsDirectional.only(end: 16, top: 20,start: 16),
    child: Container(
    height: 90,
    width: double.infinity,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [
    BoxShadow(
    color: HexColor('000000').withOpacity(0.25),
    spreadRadius: 1,
    blurRadius:  1,
    )
    ]
    ),
    child: Padding(
    padding: const EdgeInsetsDirectional.only(top: 8, start: 8,end: 8,),
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    height: 72,
    width: 72,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    image: DecorationImage(
    image: NetworkImage('http://srinternational.com.pk/wp-content/uploads/2020/10/istockphoto-177427917-170667a.jpg'),
    fit: BoxFit.cover,
    ),
    ),
    ),
    SizedBox(
    width: 8,
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Text('Sports water bottle',
    style: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    ),
    ),
    SizedBox(width: 125,),
    Icon(Icons.delete,size: 20,color: HexColor('8E8E93'),),
    ],

    ),
    SizedBox(
    height: 4,
    ),
    Text('COPOZZ',
    style: TextStyle(
    color: HexColor('8E8E93'),
    fontSize: 12,
    fontWeight: FontWeight.w400
    ),

    ),
    Spacer(),
    Padding(
    padding: const EdgeInsetsDirectional.only(bottom: 8),
    child: Row(
    children: [
    InkWell(
    onTap: (){},
    child: Container(
    height: 16,
    width: 24,
    decoration: BoxDecoration(
    color: HexColor('F7F7F7'),
    borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(5),bottomStart: Radius.circular(5)),
    boxShadow: [
    BoxShadow(
    color: HexColor('000000').withOpacity(0.25),
    spreadRadius: -0.25,
    blurRadius:  2,
    offset: Offset(-2,0)
    )
    ]
    ),
    child: Center(child:  Icon(Icons.remove,color: Colors.black,size: 10,)),
    ),
    ),
    Container(
    height: 16,
    width: 24,
    decoration: BoxDecoration(
    color: Colors.white,
    // borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(5),bottomEnd:  Radius.circular(5)),
    boxShadow: [
    BoxShadow(
    color: HexColor('000000').withOpacity(0.25),
    spreadRadius: -0.25,
    blurRadius:  2,
    offset: Offset(1,0)
    )
    ]
    ),
    child: Center(child:Text('23'),),
    ),
    InkWell(
    onTap: (){},
    child: Container(
    height: 16,
    width: 24,
    decoration: BoxDecoration(
    color: HexColor('F7F7F7'),
    borderRadius: BorderRadiusDirectional.only(topEnd: Radius.circular(5),bottomEnd:  Radius.circular(5)),
    boxShadow: [
    BoxShadow(
    color: HexColor('000000').withOpacity(0.25),
    spreadRadius: -0.25,
    blurRadius:  2,
    offset: Offset(1,0)
    )
    ]
    ),
    child: Center(child: Icon(Icons.add,color: Colors.black,size: 10,),)

    ),
    ),
    SizedBox(width: 165,),
    Text(
    '15\$',
    style: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: HexColor('3F88C5'),
    ),
    ),
    ],
    ),
    ),
    ],
    )
    ],
    ),
    ),
    ),
    ),

    ],
    ),
    separatorBuilder: (contex,index) => SizedBox(height: 2,),
    itemCount: 10,),
       ),
          //Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:  Material(
              color: HexColor('E20030'),
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Checkout()),);},
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * .05,
                  decoration: BoxDecoration(),
                  child:  Center(child: Text(  'Checkout ' ,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),)),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
