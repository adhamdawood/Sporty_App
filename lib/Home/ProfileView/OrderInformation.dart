import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:sporty_app/APIs/OrderDetails.dart';
import 'package:sporty_app/Home/ProfileView/OrderInformationDesign.dart';
class OrderInformation extends StatelessWidget {
  String city,street,date,creditCard;
  int ordersCount,index;
  double price;
  List<ProductsDetails>productDetails;

  OrderInformation({this.city,this.street,this.date,this.ordersCount,this.price,this.productDetails,this.creditCard});


  static const ROUTE_NAME = "Order information";

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
          backgroundColor: Colors.white,
          title: Text(
            'Orders history',
            style: TextStyle(color: Colors.black),
          ),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0,left: 10,right: 10),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                      border: Border.all(color: Colors.grey, width: .2)),
                  width: 400,
                  height: 650,
                  child: IconButton(
                      onPressed: () {

                      },
                      icon: Column(
                        children: [
                          Row(

                            children: [
                              Expanded(child: Text('Ordered in: ${city}, ${street} - ${date}',style: TextStyle(fontWeight: FontWeight.bold),)),

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

                                SizedBox(
                                  width: 5,
                                ),


                              ],

                            ),
                          ),
                          SizedBox(height: 20,),
                          Align(child: Text('Items',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft,),
                          SizedBox(height: 15,),
                          Container(child: ListView.builder(itemBuilder: (buildContext,index){
                            return OrderInformationDesign(productDetails[index].name,productDetails[index].amount,productDetails[index].totalItemPrice,productDetails[index].imageUrl);
                          },itemCount: 2,),width: 400,height: 450,),

                          Align(child: Text('Payment',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold),),alignment: Alignment.topLeft,),
                          SizedBox(height: 10,),
                          Align(child: Text('*****-${creditCard[12]}${creditCard[13]}${creditCard[14]}${creditCard[15]}',textAlign: TextAlign.start,),alignment: Alignment.topLeft,),
                         
                          

                         ],

                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Container(  height: 30,child: Row(  children: [Padding(
                padding: const EdgeInsets.only(left: 14.0,top: 8,right: 8,bottom: 8),
                child: Text('total',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              )
                ,Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0,top: 8,right: 8,bottom: 8),
                  child: Text('$price\$',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                )

              ],

              ),decoration: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
    color: Colors.black,),
            )
            )


          ],
        )
    );
  }
}
