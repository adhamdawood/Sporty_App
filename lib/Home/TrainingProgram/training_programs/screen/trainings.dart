import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sporty_app/Home/SportProducts/checkout/shopping_card.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_controller.dart';
import 'package:sporty_app/Home/SportProducts/products/search_model.dart';
import 'package:sporty_app/Home/TrainingProgram/single_training/training_screen.dart';
import 'package:sporty_app/Home/TrainingProgram/training_programs/screen/mydata_controller.dart';
import 'mydata_model.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key key}) : super(key: key);

  @override
  State<TrainingScreen> createState() => _ScreenState();
}

class _ScreenState extends State<TrainingScreen> {
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
 Future <List<TrainingModel>> futureData;

  // List<SearchModel> searchProductData;
  List <TrainingModel> searchedData ;
  List filter = ["Gym","Swimming","Tennis","Football"];


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

    futureData = fetchDataa(); //as List<MydataModel> ;
    //searchedData = futureData as List<MydataModel>;
    //searchProductData = searchData();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title:Text('Training programs',
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
                    //addSearchedForItem(value);
                  },
                  decoration: InputDecoration(
                      suffixIcon: PopupMenuButton(

                        itemBuilder: (BuildContext context) {
                          return filter.map((e) => PopupMenuItem(
                              value: e,
                              child: Text(e))).toList();
                        },
                        child: Icon (Icons.tune_outlined,color: HexColor('E20030'),),),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search for single_training'

                  )
              ),
            ),
            SizedBox(height: 20,),
            FutureBuilder<List<TrainingModel>>(
               future:  futureData ,
              builder: (context,snapshot,){
                if (snapshot.hasData) {
                  List<TrainingModel> data = snapshot.data;
                  return GridView.count(

                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 1,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1/0.55,


                    children: List.generate(searchController.text.isEmpty ?  data.length : searchedData.length, (index) => InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>SingleTrainingScreen(id: data[index].trainingProgramId)),);
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.only(start: 0,),
                              child: Container(
                                height: 131.0,
                                width: 328.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image:  DecorationImage(image:  NetworkImage(data[index].imageUrl.toString(),),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            Row(

                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 0.0),
                                  child: Container(
                                    width: 250,
                                    child: Text(
                                      data[index].name.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,

                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.star,color: HexColor('FFC107'),),
                                SizedBox(width: 2.0,),
                                Text('4.6',
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                           // SizedBox(height: 0.0,),
                            // Padding(
                            //   padding: const EdgeInsetsDirectional.only(start: 16.0),
                            //   child: Text(
                            //     data[index].descriptionMinimized.toString(),
                            //     maxLines: 3,
                            //     overflow: TextOverflow.ellipsis,
                            //     style: TextStyle(
                            //       fontSize: 12.0,
                            //       fontWeight: FontWeight.w400,
                            //
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 5.0,),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 0.0),
                                  child: Text("${data[index].level.toString()}",
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
                                ///
                                Text('${data[index].sportName.toString()}',
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

