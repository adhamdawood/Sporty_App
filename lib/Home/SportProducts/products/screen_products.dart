import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sporty_app/Home/SportProducts/checkout/shopping_card.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Home/SportProducts/products/mydata_controller.dart';
import 'package:sporty_app/Home/SportProducts/products/search_model.dart';
import 'mydata_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ScreenState();
}

class _ScreenState extends State<ProductScreen> {
   String query;


  void changeItemNavBottom (int index)
  {
    setState(() {
currentIndex = index;
    });
  }
  var currentIndex =0;
 var searchController = TextEditingController();
   Future<List<MydataModel>> futureData;
   Future<List<SearchModel>> searchProductData;
  List <MydataModel> searchedData = [];




  List<String> filterList = ["Gym","Football","Tennis","Swimming"];

  void initState() {
    super.initState();
    futureData = fetchData();
   // searchedData = futureData as List<MydataModel>;
    //searchProductData = searchData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   bottomNavigationBar:
    //       BottomNavigationBar(
    //           currentIndex: currentIndex,
    //           selectedItemColor:  HexColor('E20030'),
    //           onTap: (index){
    //             changeItemNavBottom(index);
    //           },
    //           type: BottomNavigationBarType.fixed,
    //           items: [
    //         BottomNavigationBarItem(
    //         icon: Icon(Icons.sports_basketball_outlined,),
    //         label: 'Products',
    //       ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.fitness_center_outlined,),
    //           label: 'Trainings',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.home,),
    //           label: 'Home',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.chat,),
    //           label: 'Chatbot',
    //         ),
    //         BottomNavigationBarItem(
    //           icon: Icon(Icons.person,),
    //           label: 'Profile',
    //         ),]
    //
    // ),


      // CircleBottomNavigation(
      //     tabs: [
      //       TabData(icon: Icons.sports_basketball_outlined,title:'Products' ),
      //       TabData(icon: Icons.fitness_center_outlined,title:'Trainings' ),
      //       TabData(icon: Icons.home,title:'Home' ),
      //       TabData(icon: Icons.chat,title: 'Chatbot'),
      //       TabData(icon: Icons.person,title: 'Profile' ),
      //     ],
      //     onTabChangedListener: changeItemNavBottom,
      //     initialSelection: currentIndex),
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,

        title:Text('Sport products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>ShoppingCard()),);
            },
            icon: Icon(Icons.shopping_bag_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42.0),
              child: TextFormField(
                  onChanged: (value)
                  {
                  },
                  decoration: InputDecoration(
                      suffixIcon: PopupMenuButton(
                        onSelected: (value){
                          if(value == "Gym"){}
                          else if (value == "Football"){}
                          else if (value == "Tennis"){}
                          else if (value == "Swimming"){}
                        },
                        itemBuilder: (BuildContext context) {
                          return filterList.map((e) => PopupMenuItem(
                              value: e,
                              child: Text(e))).toList();
                        },
                        child: Icon (Icons.tune_outlined,color: HexColor('E20030'),),),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search for product'

                  )
              ),
            ),
            FutureBuilder<List<MydataModel>>(
              future: futureData,
              builder: (context,snapshot,){
                if (snapshot.hasData) {
                  List<MydataModel> data = snapshot.data;
                  return GridView.count(
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1/1.25,
                    children: List.generate(data.length, (index) => InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>SingleProductScreen(id: data[index].productId)),);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                  height: 125.0,
                                  width: 125.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image:  DecorationImage(image:  NetworkImage(data[index].imageUrl.toString(),),
                                     // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 36.0,top: 35.0),
                                    child: Icon(Icons.star,color: HexColor('FFC107'),),
                                  ),
                                  SizedBox(width: 2.0,),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.only(top: 35.0),
                                    child: Text('4.6',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 0.0,),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 16.0),
                            child: Text(
                              data[index].descriptionMinimized.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                          ),
                          SizedBox(height: 2.0,),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 16.0),
                                child: Text(data[index].brand.toString(),
                                  style: TextStyle(
                                      color: Colors.grey
                                  ),),
                              ),
                              SizedBox(width: 8.0,),
                              Container(
                                height: 10.0,
                                width: 1.0,
                                color: HexColor('E20030'),
                              ),
                              SizedBox(width: 8.0,),
                              Text('${data[index].price.toString()}\$',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),)

                  );
                  }
                else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(child: CircularProgressIndicator());

              },

            ),

          ],
        ),
      ),

    );


  }
  // void searchProduct (String query)
  // {
  //     setState(() {
  //       futureData = searchData(query) ;
  //     });
  // }

}
