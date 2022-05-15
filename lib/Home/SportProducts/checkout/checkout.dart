import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Home/SportProducts/checkout/address.dart';
import 'package:sporty_app/Home/SportProducts/checkout/credit_card.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/user_payment_data_model.dart';
import 'package:sporty_app/Home/SportProducts/checkout/provider/provider_checkout.dart';
import 'package:sporty_app/Home/SportProducts/checkout/success.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';


class Checkout extends StatefulWidget {
  final double subTotal;
  final List <Map> products;

  const Checkout({Key key, this.subTotal, this.products}) : super(key: key);
  @override
  State<Checkout> createState() => _CheckoutState(subTotal, products);
}

class _CheckoutState extends State<Checkout> {
  UserPaymentDataModel paymentData;

  String street;
  String city;
  int building;
  String creditCardNum;
  double subTotal;
  double total ;
  ShoppingCubit cubit = new ShoppingCubit();
  List <Map> productsList;

  _CheckoutState(double subTotal,products)
  {
    this.subTotal = subTotal;
    total = subTotal + 10;
    productsList = products;
    print("in check out ${products}");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   //////////////////////////////////// print("in checkout${cacheHelperr.address}");
     ///cubit.createDatabase();

  }
  CheckoutProvider provider ;
  @override
  Widget build(BuildContext context) {
  //cubit.getSubTotal();
    provider = Provider.of<CheckoutProvider>(context);
    print("in setting provider ${productsList}");
    provider.products = productsList;
    return provider.userPayment != null ?  Scaffold(
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
                      color: Color(0xff000000).withOpacity(0.25),
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
                           child: Text("${provider.userPayment.address == null ? "Enter your address" :
                           provider.userPayment.address.street}",
                             style: TextStyle(
                               fontSize: 14,
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                         ),
                         InkWell(
                             onTap: (){
                               Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) =>Address(total: this.total,addressModel: provider.userPayment.address,)));
                             },
                             child: Icon(Icons.arrow_forward_ios,size: 20,color: Color(0xff8E8E93),))
                       ],
                     ),
                   ),
                    SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 9,),
                      child: Text("${provider.userPayment.address == null ? "" :
                      provider.userPayment.address.city}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8E8E93),
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
                      color: Color(0xff000000).withOpacity(0.25),
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
                            child: Text("Credit Card",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>CreditCard(total: total - 10,creditCard: provider.userPayment.creditCard,)));
                            },
                              child: Icon(Icons.arrow_forward_ios,size: 20,color: Color(0xff8E8E93),))
                        ],
                      ),
                    ),
                    SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 9,),
                      child: Text("${provider.userPayment.creditCard.length == 0 ?
                      "Enter your Credit Card" :
                      provider.userPayment.creditCard[0].creditCardNumber}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8E8E93),
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
                color: Color(0xffC7C7CC),
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
                        color: Color(0xff8E8E93),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 16),
                  child: Text('${subTotal} \$',
                    style: TextStyle(
                      color: Color(0xff8E8E93),
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
                        color: Color(0xff8E8E93),
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
                      color: Color(0xff8E8E93),
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
                  child: Text(' ${total} \$',
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
                color: Color(0xffE20030),
                borderRadius: BorderRadius.circular(10.0),
                child: InkWell(
                  onTap: () {
                    provider.makeApiOrder(total);
                    Navigator.push(
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
                    child:  Center(child: Text(  'Pay ${total} \$' ,
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
    ) : Center(child: CircularProgressIndicator());
  }
}
