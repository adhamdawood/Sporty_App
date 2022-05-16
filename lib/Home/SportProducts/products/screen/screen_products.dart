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
                      hintText: 'Search for product'

                  )
              ),
            ),
            Container(padding: EdgeInsets.all(5),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
                childAspectRatio: 1 / 1.25,
                children: List.generate( provider.searchProducts.length , (index) => InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>SingleProductScreen(id: provider.searchProducts[index].productId)),);
                  },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(18, 0, 5, 0),
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20.0),
                                  height: 150.0, width: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(image: NetworkImage(
                                      provider.allProducts[index].imageUrl
                                          .toString(),), // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 10.0, top: 3.0),
                                      child: Icon(
                                        Icons.star, color: Color(0xffFFC107),),
                                    ),
                                    SizedBox(width: 2.0,),
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          top: 5.0),
                                      child: Text('4.6',
                                        style: TextStyle(fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffFFC107)),),),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text(provider.allProducts[index].name.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.w400,),
                            ),
                            SizedBox(height: 5.0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(provider.allProducts[index].brand
                                      .toString(),
                                    style: TextStyle(color: Colors.grey),),
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  height: 10.0,
                                  width: 1.0,
                                  color: Color(0xffE20030),
                                ),
                                SizedBox(width: 8.0,),
                                Text('${provider.allProducts[index].price
                                    .toString()}\$',
                                  style: TextStyle(fontSize: 12.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),),
              ),
            )
          ]
    ),
    )
    ):Center(child: CircularProgressIndicator());
  }
}
