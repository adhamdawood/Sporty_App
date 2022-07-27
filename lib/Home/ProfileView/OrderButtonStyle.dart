import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/OrderDetails.dart';
import 'package:sporty_app/modules/ProfileView/OrderInformation.dart';

class OrderButtonStyle extends StatelessWidget {
String city,street,date,creditCard;
int ordersCount,index;
double price;
List<ProductsDetails>productDetails;
OrderButtonStyle(this.city,this.street,this.date,this.ordersCount,this.price,this.index,this.productDetails,this.creditCard);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10,bottom: 10),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: .2)),
              width: 400,
              height: 68,
              child: IconButton(
                  onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (_)=>OrderInformation(city: city,street: street,date: date,ordersCount: ordersCount,price: price,productDetails: productDetails  ,creditCard: creditCard,                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        )));
                  },
                  icon: Column(
                    children: [
                      Row(

                        children: [
                          Expanded(child: Text('Ordered in: ${city}, ${street} - ${date}',style: TextStyle(fontWeight: FontWeight.bold),)),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,),
                          ),
                          SizedBox(
                            width: 5,
                          ),


                        ],

                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(child: Text('${ordersCount} items',style: TextStyle(),)),
                            Text('${price}\$',style: TextStyle(color: const Color(0xFF3f88c5),fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 5,
                            ),


                          ],

                        ),
                      )
                    ],
                  ))),
        ),


      ],
    );
  }

}
