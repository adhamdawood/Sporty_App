import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/modules/SportProducts/checkout/checkout.dart';
import 'package:sporty_app/modules/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/modules/SportProducts/products/cubit/states.dart';


import '../../../componants/componants.dart';

class ShoppingCard extends StatelessWidget {
  // var training_programs = cacheHelperr.training_programs;
  // Map <int ,dynamic> itemProduct ={} ;
  // List <Map> subTotal = cacheHelperr.subTotal ;
  // @override
  void initState() {
  //   // TODO: implement initState
  //   cacheHelperr.getSubTotal();
  //
  //   print("${subTotal}");
  //
  //   fetchUserPaymentData();
  //
  //   super.initState();

  }

  //ShoppingProvider provider;

  @override
  Widget build(BuildContext context) {
    // provider = Provider.of<ShoppingProvider>(context);

    return BlocProvider(
      create: (BuildContext context) => ShoppingCubit()..createDatabase(),
      child: BlocConsumer<ShoppingCubit, ShoppingCardStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ShoppingCubit cubit = ShoppingCubit.get(context);
          //cubit.getFromDatabase()

          return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      title: Row(
                        children: [
                          Text(
                            'Shopping Card',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: cubit.products.length !=0 ? Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: new List.generate(
                              cubit.products.length,
                              (index) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        end: 16, top: 20, start: 16),
                                    child: Container(
                                      height: 90,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color: HexColor('000000')
                                                  .withOpacity(0.25),
                                              spreadRadius: 1,
                                              blurRadius: 1,
                                            )
                                          ]),
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.only(
                                          top: 8,
                                          start: 8,
                                          end: 8,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 72,
                                              width: 72,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      '${cubit.products[index]['Image']}'),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        '${cubit.products[index]['Name']}',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                      width: 200,
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          cubit
                                                              .deletFromShoppingCard(
                                                                  index);

                                                          // dynamic id = cubit.products[index]['ProductId'];
                                                          // cubit.deleteProduct(id: id)
                                                        },
                                                        child: Icon(
                                                          Icons.delete,
                                                          size: 20,
                                                          color: HexColor(
                                                              '8E8E93'),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  '${cubit.products[index]['Brand']}',
                                                  style: TextStyle(
                                                      color: HexColor('8E8E93'),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .only(bottom: 8),
                                                  child: Row(
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          cubit
                                                              .changeCounterMinus(
                                                                  index);
                                                          // setState(() {
                                                          //   products = cacheHelperr.products;
                                                          // });
                                                        },
                                                        child: Container(
                                                          height: 16,
                                                          width: 24,
                                                          decoration: BoxDecoration(
                                                              color: HexColor(
                                                                  'F7F7F7'),
                                                              borderRadius: BorderRadiusDirectional.only(
                                                                  topStart: Radius
                                                                      .circular(
                                                                          5),
                                                                  bottomStart: Radius
                                                                      .circular(
                                                                          5)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: HexColor(
                                                                            '000000')
                                                                        .withOpacity(
                                                                            0.25),
                                                                    spreadRadius:
                                                                        -0.25,
                                                                    blurRadius:
                                                                        2,
                                                                    offset:
                                                                        Offset(
                                                                            -2,
                                                                            0))
                                                              ]),
                                                          child: Center(
                                                              child: Icon(
                                                            Icons.remove,
                                                            color: Colors.black,
                                                            size: 10,
                                                          )),
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
                                                                  color: HexColor(
                                                                          '000000')
                                                                      .withOpacity(
                                                                          0.25),
                                                                  spreadRadius:
                                                                      -0.25,
                                                                  blurRadius: 2,
                                                                  offset:
                                                                      Offset(
                                                                          1, 0))
                                                            ]),
                                                        child: Center(
                                                          child: Text(
                                                              '${cubit.products[index]['Counter']}'),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          cubit
                                                              .changeCounterPlus(
                                                                  index);
                                                        },
                                                        child: Container(
                                                            height: 16,
                                                            width: 24,
                                                            decoration: BoxDecoration(
                                                                color: HexColor(
                                                                    'F7F7F7'),
                                                                borderRadius: BorderRadiusDirectional.only(
                                                                    topEnd: Radius
                                                                        .circular(
                                                                            5),
                                                                    bottomEnd: Radius
                                                                        .circular(
                                                                            5)),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: HexColor(
                                                                              '000000')
                                                                          .withOpacity(
                                                                              0.25),
                                                                      spreadRadius:
                                                                          -0.25,
                                                                      blurRadius:
                                                                          2,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              0))
                                                                ]),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .black,
                                                                size: 10,
                                                              ),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      Text(
                                                        '${cubit.products[index]['Price'] * cubit.products[index]['Counter']}\$',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 14.0,
                                                          color: HexColor(
                                                              '3F88C5'),
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
                            ),
                          ),
                        ),
                        //Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Material(
                            color: HexColor('E20030'),
                            borderRadius: BorderRadius.circular(10.0),
                            child: InkWell(
                              onTap: () {
                                //print('dddd${cubit.subTotal}');
                                if (cubit.products.length == 0) {
                                  return flutterToast(
                                      msg: "You must add a product!!");
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Checkout(
                                              subTotal: cubit.subTotal,
                                              products: cubit.products,
                                            )),
                                  );
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * .05,
                                decoration: BoxDecoration(),
                                child: Center(
                                    child: Text(
                                  'Checkout ',
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
                    )
                        : Center(child: Text("No Items",style: TextStyle(fontSize: 35,color: Colors.grey)))

                  ),
                );

              // Scaffold(
              //     backgroundColor: Colors.white,
              //     appBar: AppBar(
              //       elevation: 0,
              //       backgroundColor: Colors.white,
              //       leading: IconButton(
              //         icon: Icon(
              //           Icons.arrow_back_ios,
              //           color: Colors.black,
              //         ),
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //       title: Row(
              //         children: [
              //           Text(
              //             'Shopping Card',
              //             style: TextStyle(
              //               color: Colors.black,
              //               fontSize: 14.0,
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     body: Center(child: Text("No Items",style: TextStyle(fontSize: 35,color: Colors.grey),))
              // );
        },
      ),
    );
  }
}

///////////
