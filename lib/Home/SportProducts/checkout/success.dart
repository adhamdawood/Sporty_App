import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Home/HomeScreen.dart';
import 'package:sporty_app/Home/SportProducts/checkout/provider/provider_checkout.dart';
import 'package:sporty_app/Home/SportProducts/checkout/provider/provider_success.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';

class Success extends StatefulWidget {
  const Success({Key key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
//ShoppingProviderr provider;

  ShoppingProviderr provider ;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ShoppingProviderr>(context);
    //provider.deleteDatabase();
    return Scaffold(
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsetsDirectional.only(top: 143),
           child: Center(
             child: CircleAvatar(
               radius: 70,
               backgroundImage: AssetImage('assets/images/Success.png'),
             ),
           ),
         ),
         SizedBox(height: 55,),
         Text('Payment completed successfully',
         style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
         ),
         SizedBox(height: 10,),
         Center(
           child: Container(
             height: 42,
             width: 240,
             child: Center(
               child: Text('Your order will be shipped to your',
                 style: TextStyle(
                     fontSize: 14,
                     fontWeight: FontWeight.w500,
                   color: HexColor('8E8E93'),
                 ),
               ),
             ),
           ),
         ),
         Text(' shipping address today',
           style: TextStyle(
               fontSize: 14,
               fontWeight: FontWeight.w500,
             color: HexColor('8E8E93'),
           ),
         ),
         SizedBox(height: 30,),
         Text(' Order number : 9461320',
           style: TextStyle(
             fontSize: 14,
             fontWeight: FontWeight.w500,
             color: HexColor('3F88C5'),
           ),
         ),
         Spacer(),
         Padding(
           padding: const EdgeInsets.all(16.0),
           child:  Material(
             color: HexColor('E20030'),
             borderRadius: BorderRadius.circular(10.0),
             child: InkWell(
               onTap: () {
                 provider.deleteDatabase();
                 Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) =>HomePage()),);},
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
                 child:  Center(child: Text(  'Back To Home Page' ,
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
