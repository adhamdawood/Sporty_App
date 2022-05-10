import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporty_app/APIs/GetHomeData.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';

class getAllData extends StatelessWidget {
  GetHomeData homeData;

  getAllData(this.homeData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset("assets/images/welcomeScreen.png",width: 100,height: 20,),
        actions: const [
          Icon(
            Icons.shopping_bag_outlined,
            color: Color(0xff1c3144),
          ),
        ],
      ),
      body: Container(
         margin: const EdgeInsets.all(15),
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ////>>>>>Training
                Row(
                  children: const [
                    Text(
                      "Training Programs",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(color: Color(0xffe20030)),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  padding: const EdgeInsets.all(0.0), height: 200, width: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image:  DecorationImage(image:  NetworkImage(homeData.trainingPrograms[0].imageUrl.toString(),), // fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row (
                  children: [
                    Text(homeData.trainingPrograms[0].name),
                    const Spacer(),
                    const Icon(Icons.star, color: Color(0xffffba08),),
                    const Text('4.6')
                  ],
                ),
                Text(
                  homeData.trainingPrograms[0].level,
                  style: TextStyle(color: Color(0xff8E8E93)),
                ),
                 const SizedBox(height: 20,),
                Row(
                  children: const [
                    Text(
                      "Products",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      "View all",
                      style: TextStyle(color: Color(0xffe20030)),
                    )
                  ],
                ),
                //const SizedBox(height: 5,),


                ////>>>Products
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //>>>>First Product
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(20.0),
                                height: 150.0, width: 150.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image:  DecorationImage(image:  NetworkImage(homeData.products[0].imageUrl.toString(),), // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(start: 10.0,top: 3.0),
                                    child: Icon(Icons.star,color: Color(0xffFFC107),),
                                  ),
                                  SizedBox(width: 2.0,),
                                  Padding(
                                    padding:  EdgeInsetsDirectional.only(top: 5.0),
                                    child: Text('4.6',
                                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.white),),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text(homeData.products[0].name.toString(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,),
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(homeData.products[0].brand.toString(),
                                  style: TextStyle(color: Colors.grey),),
                              ),
                              SizedBox(width: 5,),
                              Container(
                                height: 10.0,
                                width: 1.0,
                                color: Color(0xffE20030),
                              ),
                              SizedBox(width: 8.0,),
                              Text('${homeData.products[0].price.toString()}\$',
                                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    //>>>>Second product
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>SingleProductScreen(id: homeData.products[0].productId)),);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(30.0), height: 150.0, width: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image:  DecorationImage(image:  NetworkImage(homeData.products[1].imageUrl.toString(),), // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: const [
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(start: 10.0,top: 3.0),
                                    child: Icon(Icons.star,color: Color(0xffFFC107),),
                                  ),
                                  SizedBox(width: 2.0,),
                                  Padding(
                                    padding:  EdgeInsetsDirectional.only(top: 5.0),
                                    child: Text('4.6',
                                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.white),),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text(homeData.products[1].name.toString(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400,),
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            children: [
                              Text(homeData.products[1].brand.toString(),
                                style: TextStyle(color: Colors.grey),),

                              SizedBox(width: 5,),
                              Container(
                                height: 10.0,
                                width: 1.0,
                                color: Color(0xffE20030),
                              ),
                              SizedBox(width: 8.0,),
                              Text('${homeData.products[1].price.toString()}\$',
                                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
                  ],
                ),

        ),


      );
  }
}
