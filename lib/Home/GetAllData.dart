import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sporty_app/APIs/GetData.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Models/Widgets.dart';


class getAllData extends StatelessWidget {
   GetData homeData;
  getAllData(this.homeData);
  @override
  Widget build(BuildContext context) {
    return Material(
       child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Image.asset("assets/images/welcomeScreen.png",width: 100,height: 20,),
              actions: const [
                Icon(
                  Icons.shopping_bag_outlined, color: Color(0xff1c3144),),
              ],
            ),
            body: Container(
              margin: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  ////>>>>>Training
                  Row(
                    children: const [
                      Text("Training Programs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Text("View all", style: TextStyle(color: Color(0xffe20030)),
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
                            childAspectRatio: 0.75,
                              crossAxisCount: 1,mainAxisSpacing: 8,crossAxisSpacing: 0),
                          itemBuilder: (_, index) =>TrainingProgramsWidget(homeData.trainingPrograms[index]),
                          itemCount: homeData.trainingPrograms.length,
                        ),
                      ),
                    SizedBox(height: 10,),
                  ////>>>Products
                  Row(
                    children: const [
                      Text("Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Spacer(),
                      Text("View all", style: TextStyle(color: Color(0xffe20030)),
                      )],),
                  Expanded(
                    flex: 1,
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.4,
                          crossAxisCount: 1,mainAxisSpacing: 0,crossAxisSpacing: 0),
                      itemBuilder: (_, index) =>ProductsWidget(homeData.products[index]),
                      itemCount: homeData.products.length,
                    ),
                  ),
                ],
              ),

            ),
          ),
    );

  }
}
