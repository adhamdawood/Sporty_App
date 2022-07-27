import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/modules/SportProducts/checkout/checkout.dart';

import 'model/CreditCardModel.dart';
import 'provider/provider_checkout.dart';

class CreditCard extends StatefulWidget {
  final double total;
  final List<CreditCardModel> creditCard;
  const CreditCard({Key key, this.total, this.creditCard}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState(total,creditCard);
}

class _CreditCardState extends State<CreditCard> {
  var credirCardNumController = TextEditingController();
  var expirationDateController = TextEditingController();
  var zipCodeController = TextEditingController();
List<CreditCardModel> creditCards;
  double subtotal;
var formKey = GlobalKey<FormState>();

  _CreditCardState(total, List<CreditCardModel> creditCard){
    subtotal = total;
    creditCards = creditCard;
    if(creditCards.length != 0){
      credirCardNumController.text = creditCards[0].creditCardNumber;
      expirationDateController.text = creditCards[0].expirationDate;
      zipCodeController.text = creditCards[0].zipcode;
    }
  }


  CheckoutProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<CheckoutProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,)),
        title: Text("Credit card",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600 ),),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15,end: 15,top: 40 ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Credit card number",
                  style: TextStyle(
                      color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  )),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: credirCardNumController,
                maxLength: 16,
                validator: (value){
                  if(value.isEmpty)
                  {
                    return ' credit card number must not be empty';

                  }
                  return null;

                } ,

              ),
              SizedBox(height: 30,),
              Text("Zipcode",
                  style: TextStyle(color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  ),),
              TextFormField(keyboardType: TextInputType.number,
                controller: zipCodeController,
                maxLength: 5,
                validator: (value){
                  if(value.isEmpty)
                  {
                    return ' zipcode must not be empty';

                  }
                  return null;

                } ,
              ),
              SizedBox(height: 30,),
              Text("Expiration date",
                  style: TextStyle(color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                  )),
              TextFormField(
                controller: expirationDateController,
                keyboardType: TextInputType.datetime,
                // onTap: (){
                //   showDatePicker(context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime.now(),
                //       lastDate: DateTime(2100)).then((value) {
                //     expirationDateController.text = DateFormat.yMMMd().format(value);
                //
                //   });;
                // },
                validator: (value){
                  if(value.isEmpty)
                  {
                    return 'expiration date must not be empty';

                  }
                  return null;

                } ,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.date_range_outlined,color: Colors.black,)
                ),
              ),
             Spacer(),
             //  SizedBox(height: 240,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child:  Material(
                  color: Color(0xffE20030),
                  borderRadius: BorderRadius.circular(10.0),
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState.validate()){
                        provider.setCreditCard(credirCardNumController.text,
                            expirationDateController.text, zipCodeController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>Checkout(subTotal: subtotal,)),);
                      }

                      },
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
                      child:  Center(child: Text(  'Update' ,
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
      ),
    );

  }
}
