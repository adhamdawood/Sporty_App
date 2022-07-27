import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Home/SportProducts/checkout/shopping_card.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_controller.dart';
import 'mydata_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ScreenState();
}

class _ScreenState extends State<ProductScreen> {
  String query;

  // void changeItemNavBottom (int index)

//   {
//     setState(() {
// currentIndex = index;
//     });
//   }
  dynamic itemProduct = 0 ;
  var currentIndex =0;
  var searchController = TextEditingController();

  // List<SearchModel> searchProductData;
  List <MydataModel> searchedData ;
  List filter = ["All","Gym","Swimming","Tennis","Football"];


// MydataModel _selectoption =filterList as MydataModel ;
// void _select(MydataModel mydataModel){
//   setState(() {
//     _selectoption = mydataModel;
//   });
// }

  // void addSearchedForItem(String value)
  // {
  //   searchedData = futureData.where((character) => character.sportName.toLowerCase().startsWith(value)).toList() as List<MydataModel>;
  //   setState(() {});
  // }


  void initState() {
    super.initState();
    //BlocProvider.of<ShoppingCubit>(context).createDatabase();

    //searchedData = futureData as List<MydataModel>;
    //searchProductData = searchData();

  }

  ProductProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context);
    return provider.searchProducts != null ?  Scaffold(
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
                        controller: searchController,
                        onChanged: (value)
                        {
                          provider.searchItems(value);
                        },
                        decoration: InputDecoration(
                            suffixIcon: PopupMenuButton(
                              onSelected: (value){
                                provider.filterItems(value);
                              },
                              itemBuilder: (BuildContext context) {
                                return filter.map((e) => PopupMenuItem(
                                    value: e,
                                    child: Text(e))).toList();
                              },
                              child: Icon (Icons.tune_outlined,color: HexColor('E20030'),),),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search for products'

                        )
                    ),
                  ),
                  GridView.count(

                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1/1.25,

                      children: List.generate( provider.searchProducts.length , (index) => InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>SingleProductScreen(id: provider.searchProducts[index].productId)),);
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
                                      image:  DecorationImage(image:  NetworkImage(provider.searchProducts[index].imageUrl.toString(),),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                // Row(
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsetsDirectional.only(start: 36.0,top: 35.0),
                                //       child: Icon(Icons.star,color: HexColor('FFC107'),),
                                //     ),
                                //     SizedBox(width: 2.0,),
                                //     Padding(
                                //       padding: const EdgeInsetsDirectional.only(top: 35.0),
                                //       child: Text('4.6',
                                //         style: TextStyle(
                                //             fontSize: 12.0,
                                //             fontWeight: FontWeight.w600,
                                //             color: Colors.black
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),

                              ],
                            ),
                            SizedBox(height: 0.0,),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(start: 16.0),
                              child: Text(
                                provider.searchProducts[index].descriptionMinimized.toString(),
                                maxLines: 1,
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
                                  child: Text(provider.searchProducts[index].brand.toString(),
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
                                Text('${provider.searchProducts[index].price.toString()}\$',
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

                  )]))) : Center(child: CircularProgressIndicator());



  }
// void searchProduct (String query)
// {
//     setState(() {
//       futureData = searchData(query) ;
//     });
// }

}
// Future<List<MydataModel>> filterList =  [
//   MydataModel(sportName: "gym" ),
//   MydataModel(sportName: "tennis"),
//   MydataModel(sportName: "swimming"),
//   MydataModel(sportName: "football"),
//
// ] as Future<List<MydataModel>>;
// class ChoiceCard extends StatelessWidget{
//   final MydataModel mydataModel;
//
//   const ChoiceCard({Key key, this.mydataModel}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     return FutureBuilder<List<MydataModel>>(
//       future: filterList,
//       builder: (context,snapshot,){
//         if (snapshot.hasData) {
//           List<MydataModel> data = snapshot.data;
//           return GridView.count(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               mainAxisSpacing: 0.0,
//               crossAxisSpacing: 0.0,
//               childAspectRatio: 1/1.25,
//               children: List.generate(data.length, (index) => InkWell(
//                 onTap: (){
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) =>SingleProductScreen(id: data[index].productId)),);
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(30.0),
//                           child: Container(
//                             height: 125.0,
//                             width: 125.0,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10.0),
//                               image:  DecorationImage(image:  NetworkImage(data[index].imageUrl.toString(),),
//                                 // fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(start: 36.0,top: 35.0),
//                               child: Icon(Icons.star,color: HexColor('FFC107'),),
//                             ),
//                             SizedBox(width: 2.0,),
//                             Padding(
//                               padding: const EdgeInsetsDirectional.only(top: 35.0),
//                               child: Text('4.6',
//                                 style: TextStyle(
//                                     fontSize: 12.0,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//
//                       ],
//                     ),
//                     SizedBox(height: 0.0,),
//                     Padding(
//                       padding: const EdgeInsetsDirectional.only(start: 16.0),
//                       child: Text(
//                         data[index].descriptionMinimized.toString(),
//                         maxLines: 3,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 12.0,
//                           fontWeight: FontWeight.w400,
//
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 2.0,),
//                     Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsetsDirectional.only(start: 16.0),
//                           child: Text(data[index].brand.toString(),
//                             style: TextStyle(
//                                 color: Colors.grey
//                             ),),
//                         ),
//                         SizedBox(width: 8.0,),
//                         Container(
//                           height: 10.0,
//                           width: 1.0,
//                           color: HexColor('E20030'),
//                         ),
//                         SizedBox(width: 8.0,),
//                         Text('${data[index].price.toString()}\$',
//                           style: TextStyle(
//                               fontSize: 12.0,
//                               fontWeight: FontWeight.w600,
//                               fontStyle: FontStyle.normal
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),)
//
//           );
//         }
//         else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }
//         return Center(child: CircularProgressIndicator());
//
//       },
//
//     );
//   }
