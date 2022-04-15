import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sporty_app/Home/SportProducts/checkout/success.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
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
            Text('Checkout',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),),

          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16,end: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12,),
            Text('Order information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 52,),
            Text('Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 70,
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
                padding: const EdgeInsetsDirectional.only(top: 8, start: 8,end: 8,bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Padding(
                     padding: const EdgeInsetsDirectional.only(start: 9,top: 9,),
                     child: Row(
                       children: [
                         Expanded(
                           child: Text('omar elmokhtar street',
                             style: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                         ),
                         Icon(Icons.arrow_forward_ios,size: 20,color: HexColor('8E8E93'),)
                       ],
                     ),
                   ),
                    SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 9,),
                      child: Text('Alexandria',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: HexColor('8E8E93'),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height:42,),
            Text('Payment',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 70,
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
                padding: const EdgeInsetsDirectional.only(top: 8, start: 8,end: 8,bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 9,top: 9,),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('omar elmokhtar street',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios,size: 20,color: HexColor('8E8E93'),)
                        ],
                      ),
                    ),
                    SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 9,),
                      child: Text('*****-0921',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: HexColor('8E8E93'),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 55,),
            Center(
              child: Container(
                width: 328,
                height: 1,
                color: HexColor('C7C7CC'),
              ),
            ),
            SizedBox(height: 22,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    child: Text('subtotal',
                      style: TextStyle(
                        color: HexColor('8E8E93'),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: Text('100\$',
                    style: TextStyle(
                      color: HexColor('8E8E93'),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    child: Text('Delivery fees',
                      style: TextStyle(
                        color: HexColor('8E8E93'),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: Text('10\$',
                    style: TextStyle(
                      color: HexColor('8E8E93'),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 16),
                    child: Text('total',
                      style: TextStyle(
                        //color: HexColor('8E8E93'),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: Text('110\$',
                    style: TextStyle(
                     // color: HexColor('8E8E93'),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:  Material(
                color: HexColor('E20030'),
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Success()),);},
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
                    child:  Center(child: Text(  'Pay 110\$' ,
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
      ),
    );
  }
}
