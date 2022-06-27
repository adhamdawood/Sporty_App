import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Home/SportProducts/checkout/checkout.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/address_model.dart';
import 'package:sporty_app/Home/SportProducts/checkout/provider/provider_checkout.dart';

class Address extends StatefulWidget {
  final double total;

 final AddressModel addressModel;

  const Address({Key key, this.total, this.addressModel}) : super(key: key);

  @override
  State<Address> createState() => _AddressState(total, addressModel);
}

class _AddressState extends State<Address> {
  var formKey = GlobalKey<FormState>();
  final controlerCity = TextEditingController();
  final controlerStreet = TextEditingController();
  final controlerBuilding = TextEditingController();
  final controlerMobile = TextEditingController();
  double subTotal;
AddressModel address;
CheckoutProvider provider;

  _AddressState(double total, AddressModel addressModel){
    subTotal = total - 10;
    address = addressModel;
    if(address != null){
      controlerCity.text = address.city;
      controlerStreet.text = address.street;
      controlerBuilding.text = address.buildingNumber.toString();
      controlerMobile.text = address.MobileNumber.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CheckoutProvider>(context);

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
        title: Text("Address",style: TextStyle(fontSize: 14 ,color: Colors.black,fontWeight: FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 15, end: 15, top: 40),
            child: Form(
              key: formKey,
              child: Column(

                children: [
                 SingleChildScrollView(
                   child: Container(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,

                       children: [
                         Text("City",
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400)),
                         TextFormField(
                           decoration: InputDecoration(
                               suffixIcon: Icon(Icons.keyboard_arrow_down_outlined)),
                           keyboardType: TextInputType.text,
                           controller: controlerCity,
                           validator: (value) {
                             if (value.isEmpty) {
                               return ' city must not be empty';
                             }
                             return null;
                           },
                         ),
                         SizedBox(
                           height: 30,
                         ),
                         Text(
                           "Street",
                           style: TextStyle(
                               color: Colors.grey,
                               fontSize: 14,
                               fontWeight: FontWeight.w400),
                         ),
                         TextFormField(
                           keyboardType: TextInputType.streetAddress,
                           controller: controlerStreet,
                           validator: (value) {
                             if (value.isEmpty) {
                               return ' street must not be empty';
                             }
                             return null;
                           },
                         ),
                         SizedBox(
                           height: 30,
                         ),
                         Text("Building",
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400)),
                         TextFormField(
                           keyboardType: TextInputType.number,
                           controller: controlerBuilding,
                           onTap: () {},
                           validator: (value) {
                             if (value.isEmpty) {
                               return 'expiration date must not be empty';
                             }
                             return null;
                           },
                         ),
                         SizedBox(
                           height: 30,
                         ),
                         Text("Mobile Number",
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontSize: 14,
                                 fontWeight: FontWeight.w400)),
                         TextFormField(
                           keyboardType: TextInputType.number,
                           controller: controlerMobile,
                           onTap: () {},
                           validator: (value) {
                             if (value.isEmpty) {
                               return 'mobile number must not be empty';
                             }
                             return null;
                           },
                         ),
                       ],
                     ),
                   ),
                 ),
                  SizedBox(height: 215,),
                  //Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                      color: HexColor('E20030'),
                      borderRadius: BorderRadius.circular(10.0),
                      child: InkWell(
                        onTap: () {
                          if (formKey.currentState.validate()) {
                            provider.moveData(controlerCity.text,
                                controlerStreet.text, int.parse(controlerBuilding.text), controlerMobile.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Checkout(subTotal: subTotal,)),
                            );
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .05,
                          decoration: BoxDecoration(),
                          child: Center(
                              child: Text(
                            'Update',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
