import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Home/SportProducts/checkout/shopping_card.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_controller.dart';
import 'package:sporty_app/Home/SportProducts/products/search_model.dart';
import 'package:sporty_app/Home/TrainingProgram/single_training/training_screen.dart';
import 'package:sporty_app/Home/TrainingProgram/training_programs/screen/mydata_controller.dart';
import 'mydata_model.dart';
import 'package:sporty_app/Home/TrainingProgram/training_programs/screen/provider_trainings.dart';


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
 //var searchController = TextEditingController();
 Future <List<TrainingModel>> futureData;

  // List<SearchModel> searchProductData;
  List <TrainingModel> searchedData ;
  List filter = ["All","Gym","Swimming","Tennis","Football"];





  void initState() {
    super.initState();


  }

  TrainingProvider provider ;

  @override
  Widget build(BuildContext context) {

    provider = Provider.of<TrainingProvider>(context);
        return provider.searchTraining != null ?  Scaffold(
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
                        padding: const EdgeInsets.symmetric(horizontal: 38.0),
                        child: TextFormField(
                            //controller: searchController,
                            onChanged: (value)
                            {
                              provider.searchItems(value);
                            },
                            decoration: InputDecoration(
                                suffixIcon: PopupMenuButton(

                                  onSelected: (value) {
                                    provider.filterItems(value);

                                  },
                                  itemBuilder: (BuildContext context) {

                                    return filter.map((e) => PopupMenuItem(
                                        value: e,
                                        child: Text(e))).toList();
                                  },
                                  child: Icon (Icons.tune_outlined,color: HexColor('E20030'),),),
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search for training'

                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      GridView.count(

                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 1,
                          mainAxisSpacing: 0.0,
                          crossAxisSpacing: 0.0,
                          childAspectRatio: 1/0.55,


                          children: List.generate(  Provider.of<TrainingProvider>(context).searchTraining.length , (index) => InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>SingleTrainingScreen(id: provider.searchTraining[index].trainingProgramId)),);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 0,),
                                      child: Container(
                                        height: 150.0,
                                        width: 340.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.0),
                                          image: DecorationImage(image:  NetworkImage(provider.searchTraining[index].imageUrl.toString(),),
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
                                              provider.searchTraining[index].name.toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400,

                                              ),
                                            ),
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
                                          child: Text("${provider.searchTraining[index].level.toString()}",
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
                                        Text('${provider.searchTraining[index].sportName.toString()}',
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
                            ),
                          ),)

                      )]))) : Center(child: CircularProgressIndicator());
      }




              }
