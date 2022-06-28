import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sporty_app/APIs/GetData.dart';
import 'package:sporty_app/Home/HomeScreen.dart';
import 'package:sporty_app/Home/SportProducts/checkout/shopping_card.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/screen_products.dart';
import 'package:sporty_app/Models/Widgets.dart';


class getAllData extends StatefulWidget {
   GetData homeData;
  getAllData(this.homeData);

  @override
  State<getAllData> createState() => _getAllDataState();
}

class _getAllDataState extends State<getAllData> {
  @override
  Widget build(BuildContext context) {
    return Material(
       child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            //   leading: Padding(
            //     padding: const EdgeInsetsDirectional.only(start: 16),
            //     child: Image.asset("assets/images/Home2.png",width: 200,height: 40,),
            //   ),
            //   actions: const [
            //     Padding(
            //       padding: EdgeInsetsDirectional.only(end: 20),
            //       child: Icon(
            //         Icons.shopping_bag_outlined, color: Color(0xff1c3144),),
            //     ),
            //   ],
            // ),
            body: Padding(
              padding: const EdgeInsetsDirectional.only(top: 40,start: 16,end: 10),
              child: Container(
                margin: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget> [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Image.asset("assets/images/Home2.png",width: 65,height: 60,),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 17),
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>ShoppingCard()),);
                            },
                            child: Icon(
                              Icons.shopping_bag_outlined, color: Color(0xff1c3144),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),

                    ////>>>>>Training
                    // CarouselSlider(
                    //     items: ,
                    //     options: options),
                    Row(
                      children:  [
                        Text("Training Programs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) =>HomePage(1)),);
                          },
                          child: Text("View all", style: TextStyle(color: Color(0xffe20030)),
                          ),
                        )
                      ],
                    ),
                         SizedBox(height: 5,),
                        Expanded(
                          flex: 1,
                          child: GridView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.747,
                                crossAxisCount: 1,mainAxisSpacing: 5,crossAxisSpacing: 0),
                            itemBuilder: (_, index) =>TrainingProgramsWidget(widget.homeData.trainingPrograms[index],context),
                            itemCount: widget.homeData.trainingPrograms.length,
                          ),
                        ),
                      SizedBox(height: 25,),
                    ////>>>Products
                    Row(
                      children:  [
                        Text("Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) =>HomePage(0)),);
                          },
                          child: Text("View all", style: TextStyle(color: Color(0xffe20030)),

                          ),
                        ),
                      ],),
                    SizedBox(height: 5),
                    Expanded(
                      flex: 1,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.5,
                            crossAxisCount: 1,mainAxisSpacing: 7,crossAxisSpacing: 0),
                        itemBuilder: (_, index) =>ProductsWidget(widget.homeData.products[index],context),
                        itemCount: widget.homeData.products.length,
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ),
    );

  }
}
