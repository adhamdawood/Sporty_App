import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sporty_app/Home/SportProducts/checkout/shopping_card.dart';
import 'package:sporty_app/Home/SportProducts/product/product_screen.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/cubit.dart';
import 'package:sporty_app/Home/SportProducts/products/screen/mydata_controller.dart';
import 'package:sporty_app/Home/SportProducts/products/search_model.dart';
import 'package:sporty_app/Providers/productsProvider.dart';
import 'mydata_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ScreenState();
}

class _ScreenState extends State<ProductScreen> {
   String query;
  dynamic itemProduct = 0 ;
  var currentIndex =0;
 var searchController = TextEditingController();

  // List<SearchModel> searchProductData;
  List <MydataModel> searchedData ;
  List filter = ["All","Gym","Swimming","Tennis","Football"];

  void initState() {
    super.initState();
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

        title: Text('Sport products',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShoppingCard()),);
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
                      hintText: 'Search for product'

                  )
              ),
            ),]
    ),
    )
    ):CircularProgressIndicator();
  }

}
