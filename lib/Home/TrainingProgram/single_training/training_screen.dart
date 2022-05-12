import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sporty_app/Home/SportProducts/product/product_controller.dart';
import 'package:sporty_app/Home/SportProducts/product/product_model.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/Home/SportProducts/products/cart_product_model.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/states.dart';
import 'package:sporty_app/Home/TrainingProgram/single_training/training_controller.dart';
import 'package:sporty_app/Home/TrainingProgram/single_training/training_model.dart';

class SingleTrainingScreen extends StatefulWidget {
  final String id;
  const SingleTrainingScreen({Key key, this.id}) : super(key: key);

  @override
  State<SingleTrainingScreen> createState() => _ProductScreenState(id);
}

class _ProductScreenState extends State<SingleTrainingScreen> {
   Future <SingleTrainingModel> futureData;

  String id ;
  _ProductScreenState(String id){
   this.id = id;
  }
  void initState() {
    super.initState();
    //BlocProvider.of<ShoppingCubit>(context)..createDatabase();
    futureData = singleTrainingData(id: this.id) ;
  }

  @override
  Widget build(BuildContext context) {
    ShoppingCubit cubit = new ShoppingCubit();
    cubit.createDatabase();
    //cubit.getSubTotal();

        return Scaffold(
          body:
          FutureBuilder<SingleTrainingModel>(
              future: futureData,
              builder: (context,snapshot,) {
                if (snapshot.hasData ) {
                  SingleTrainingModel data = snapshot.data;
                  if(data.isReserved == false)
                  {return Stack(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * .53,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('${data.imageUrl}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 40,
                        child: Row(
                          children: [
                            IconButton(onPressed: () {
                              Navigator.pop(context);
                            },
                                icon: Icon(
                                  Icons.arrow_back_ios, color: HexColor('E20030'),)),
                            SizedBox(width: 270,),
                            IconButton(onPressed: () {},
                                icon: Icon(Icons.shopping_bag_outlined,
                                  color: Colors.white,)),

                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .53,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.3),
                                  offset: Offset(0, -4),
                                  blurRadius: 8,
                                ),
                              ]
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 18, top: 24.0, end: 16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${data.name}',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18.0,

                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${data.pricePerMonth}\$',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                        color: HexColor('E20030'),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 16),
                                    child: Icon(Icons.location_on_outlined, color: Colors.black,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      start: 5, top: 0,),
                                    child: Container(
                                      width: 300,
                                      child: Text(
                                        '${data.location}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          //color: HexColor('8E8E93'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  start: 25, top: 10,),
                                child: Text(
                                  '${data.level}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                    color: HexColor('8E8E93'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 18, top: 12, end: 16.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.star, color: HexColor('FFC107'),),
                                    SizedBox(width: 5.0,),
                                    Text('4.6',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),
                                    SizedBox(width: 8.0,),
                                    Container(
                                      width: 1.0,
                                      height: 10.0,
                                      color: HexColor('#E20030'),
                                    ),
                                    SizedBox(width: 8.0,),
                                    Text('84 reviews',
                                      style:
                                      TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      start: 20, top: 0,),
                                    child: Text(
                                      'Club : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        //color: HexColor('8E8E93'),
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      start: 8, top: 0,),
                                    child: Text(
                                      '${data.provider}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        color: HexColor('8E8E93'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, top: 5, end: 16.0),
                                child: Text('Description',
                                  maxLines: 8,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),

                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    start: 20, top: 8, end: 16.0),
                                child: Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 115,
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      child: Text('${data.description}',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w400,
                                            color: HexColor('8E8E93')
                                        ),
                                      ),
                                    ),
                                  ),
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
                                      /// var product = new CartProductModel(productId: data.trainingProgramId,
                                      ///     name: data.name, counter: 1, brand: data.level, price: data.pricePerMonth
                                      ///     ,imageUrl: data.imageUrl);
                                      /// print('screeeeen ${product.productId}');
                                      /// cubit.insertDatabase( cartProduct: product );


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
                                      child:  Center(child: Text(  'Add To Cart' ,
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
                    ],
                  );}

                  //////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////
                  //////////////////////////////////////////////////////////////////////
                  else if (data.isReserved == true) {
                    return Stack(
                      children: [
                        Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * .53,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('${data.imageUrl}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 40,
                          child: Row(
                            children: [
                              IconButton(onPressed: () {
                                Navigator.pop(context);
                              },
                                  icon: Icon(
                                    Icons.arrow_back_ios, color: HexColor('E20030'),)),
                              SizedBox(width: 270,),
                              IconButton(onPressed: () {},
                                  icon: Icon(Icons.shopping_bag_outlined,
                                    color: Colors.white,)),

                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(

                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: MediaQuery
                                .of(context)
                                .size
                                .height * .53,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    offset: Offset(0, -4),
                                    blurRadius: 8,
                                  ),
                                ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 18, top: 24.0, end: 16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${data.name}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.0,

                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${data.pricePerMonth}\$',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0,
                                          color: HexColor('E20030'),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                    start: 18, top: 10,),
                                  child: Text(
                                    '${data.level}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      color: HexColor('8E8E93'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 18, top: 12, end: 16.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star, color: HexColor('FFC107'),),
                                      SizedBox(width: 5.0,),
                                      Text('4.6',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      SizedBox(width: 8.0,),
                                      Container(
                                        width: 1.0,
                                        height: 10.0,
                                        color: HexColor('#E20030'),
                                      ),
                                      SizedBox(width: 8.0,),
                                      Text('84 reviews',
                                        style:
                                        TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400
                                        ),
                                      ),
                                      SizedBox(width: 8.0,),



                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 18, top: 12, end: 16.0),
                                  child: Text('Out of stock',
                                    style:
                                    TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor('#E20030'),

                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20, top: 35, end: 16.0),
                                  child: Text('Description',
                                    maxLines: 8,
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),

                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 20, top: 8, end: 16.0),
                                  child: Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 115,
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        child: Text('${data.description}',
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                              color: HexColor('8E8E93')
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ),
                                // Spacer(),
                                // Padding(
                                //   padding: const EdgeInsets.all(16.0),
                                //   child:  Material(
                                //     color: HexColor('E20030'),
                                //     borderRadius: BorderRadius.circular(10.0),
                                //     child: InkWell(
                                //       onTap: () {
                                //         print (data.isOutOfStock);
                                //       },
                                //       child: Container(
                                //         width: MediaQuery
                                //             .of(context)
                                //             .size
                                //             .width,
                                //         height: MediaQuery
                                //             .of(context)
                                //             .size
                                //             .height * .05,
                                //         decoration: BoxDecoration(),
                                //         child:  Center(child: Text(  'aaaaaaaaaaaaaaaa' ,
                                //           style: TextStyle(
                                //               fontSize: 14.0,
                                //               fontWeight: FontWeight.w500,
                                //               color: Colors.white),)),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }

                }
                else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text("${snapshot.error}",style: TextStyle(fontSize: 20),),
                  );
                }
                return Center(child: CircularProgressIndicator());
              }),
        );
      }




  }


