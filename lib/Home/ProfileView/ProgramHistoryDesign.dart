import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgramHistoryDesign extends StatelessWidget {
  String name,level,date,creditCard,image;
  int ordersCount,index;
  int price;

 ProgramHistoryDesign({this.name,this.level,this.date,this.index,this.price,this.ordersCount,this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,left: 10,right: 10),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: .2)),
              width: 400,
              height: 130,
              child:
                   Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(alignment: Alignment.topLeft,child: Text('Booked in $date',style: TextStyle(fontWeight: FontWeight.bold,))),
                      ),


                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.fill




                                  )

                                ),
                                width: 85,height: 80,
                                 ),
                          ),



                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0,bottom: 4.0,top: 7),
                                  child: Text(name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0,bottom: 10.0,top: 14.0),
                                  child: Text(level,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0,bottom: 9.0,top: 4.0),
                                  child: Text("$price\$".toString(),style: TextStyle(color: const Color(0xFF3f88c5),fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),


                        ],

                      )
                    ],
                  )),
        ),


      ],
    );
    /*Column(
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
                            },
                  icon: Column(
                    children: [
                      Expanded(child: Text('Booked in: ${date}',style: TextStyle(fontWeight: FontWeight.bold),)),

                      SizedBox(
                        width: 5,
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
    );*/
  }
}
