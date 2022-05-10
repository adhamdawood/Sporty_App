
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sporty_app/Home/SportProducts/checkout/model/address_model.dart';
import 'package:sporty_app/Home/SportProducts/products/cart_product_model.dart';
import 'package:sporty_app/Home/SportProducts/products/cubit/states.dart';
import 'package:sqflite/sqflite.dart';


class ShoppingCubit extends Cubit<ShoppingCardStates>{

  ShoppingCubit() : super(ShoppingInitialState());

  static ShoppingCubit get(context) => BlocProvider.of(context);
   Database database;
   List <Map> products = [];
   double subTotal;
   var counter;


    AddressModel address;

   void createDatabase ()async
  {
       await openDatabase(
      'sportyy.db',
      version: 1,
      onCreate: (database, version)
      {
        print('created');
          database.execute('CREATE TABLE cart (ProductId TEXT PRIMARY KEY, Name TEXT , Brand TEXT , Image TEXT, Price REAL, Counter INTEGER)').then((value)
        {
          print('table created');
        }).catchError((error){
          print('error when creating ${error.toString()}');
        });

        database.execute('CREATE TABLE address (UserId TEXT PRIMARY KEY, Street TEXT , City TEXT , Building INTEGER)').then((value)
        {
          print('table ADDRESS created');
        }).catchError((error){
          print('error when creating ${error.toString()}');
        });

        database.execute('CREATE TABLE credit (UserId TEXT PRIMARY KEY, CreditCardNum TEXT , ZipCode TEXT , ExpirationDate TEXT)').then((value)
        {
          print('table credit created');
        }).catchError((error){
          print('error when creating ${error.toString()}');
        });
      },
      onOpen: (database)
      {
        //getFromDatabase(database);
        emit(ShoppingGetDatabaseState());
        print('opened');
      },


    ).then((value) {
      database = value;
      getFromDatabase(database);
      getSubTotal(database);
      emit(ShoppingCreateDatabaseState());
     });

  }

   void insertDatabase ({
    CartProductModel cartProduct,
  }
  ) async
   {
     print('in isert ${cartProduct.productId}');
     print('in iserttttttttttt ${database.isOpen}');
    database.rawQuery('SELECT ProductId FROM cart where ProductId = ?', [cartProduct.productId])
        .then((value) {
          if(value[0]['ProductId'] == cartProduct.productId){

            increaseCounter(cartProduct.productId);
            getFromDatabase(database);
            emit(ShoppingGetDatabaseState());
          }
          else{
            insertProduct(cartProduct);
            getFromDatabase(database);
            print('444444$database');
            emit(ShoppingGetDatabaseState());
          }


    });
  }
   void getFromDatabase (database)
  {
    products = [];
    //emit(AppGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM cart').then((value) {

      value.forEach((element)
      {
          products.add(element);
      });
      emit(ShoppingGetDatabaseState());
    });
  }

   void getSubTotal(dynamic database)async{
    await database.rawQuery('SELECT SUM(Counter*Price) as subTotal FROM cart ').then((value) {
      // print("${subTotal}")
      print('${value}');

      subTotal = value[0]['subTotal'];

      print("${subTotal}");

      emit(ShoppingsubTotalState(subTotal));


    });
  }
   void updateDatabase (
  {
   int counter,
   dynamic id,
  }) async
  {
    database.rawUpdate(
      'UPDATE cart SET Counter = ? WHERE ProductId = ?',
      [counter, id],
    ).then((value) {
      getFromDatabase(database);
      emit(ShoppingUpdateDatabaseState());
    });
  }

   void increaseCounter(dynamic id) async{
    database.rawUpdate(
      'UPDATE cart SET Counter = Counter + 1 WHERE ProductId = ?',
      [id],
    ).then((value) {
      getFromDatabase(database);
       emit(ShoppingUpdateDatabaseState());
    });
  }

   void insertProduct(CartProductModel cartProduct) async{

  await database.transaction((txn)  {
  txn.rawInsert('INSERT INTO cart (ProductId, Name, Brand, Image, Price, Counter)'
  ' VALUES("${cartProduct.productId}", "${cartProduct.name}", "${cartProduct.brand}" '
  ',"${cartProduct.imageUrl}", "${cartProduct.price}", "${cartProduct.counter}")').then((value) {

  print('inserted success $value');
   emit(ShoppingInsertDatabaseState());
  }).catchError((error){});

  });
}

   void deleteProduct (
  {
   dynamic id,
  }) async
  {
    database.rawDelete(
      'DELETE FROM cart  WHERE ProductId = ?', [id],
    ).then((value) {
      getFromDatabase(database);

      emit(ShoppingDeleteDatabaseState());
    });
  }

   void deleteDatabase() async{
    database.rawDelete('DELETE FROM cart').then((value){
      getFromDatabase(database);
    });
  }


  void changeCounterMinus(int index){
    counter = products[index]['Counter'];
    counter--;
    if(counter == 0){
      dynamic id = products[index]['ProductId'];
      deleteProduct(id: id);
    }
    else{
      updateDatabase(counter: counter,
          id: products[index]['ProductId']);
    }

     emit(ShoppingMinusState());

  }


  void changeCounterPlus(int index){

  increaseCounter(products[index]['ProductId']);
     emit(ShoppingPlusState());

  }

  void deletFromShoppingCard(int index){
    dynamic id = products[index]['ProductId'];
    deleteProduct(id: id);
    emit(ShoppingDeletFromShoppingCardState());
  }

//////////// Address//////////////////////////////////////
  void getAddressFromDatabase (database, token)
  {
    database.rawQuery('SELECT * FROM Address where UserId = ?', [token]).then((value) {

      print("address data type ${value}");

      address = new AddressModel(street: value[0]['Street'], city: value[0]['City'], buildingNumber: value[0]['Building']);
      print("${address.city}, ${address.street}");
      emit(ShoppingGetDatabaseState());
    });
  }

  void insertAddress(AddressModel model, String token)
  async {
    database.rawQuery('SELECT UserId FROM address where UserId = ?', [token])
        .then((value) {
      print("token ${value}");
      if(value[0]['UserId'] == token){
        updateAddress(model, token);
      }
      else{
        insertFirstAddress(model, token);
      }
    });
  }

  void insertFirstAddress(AddressModel model, String token) async{
    await database.transaction((txn)  {
      txn.rawInsert('INSERT INTO address (UserId, Street, City, Building)'
          ' VALUES("${token}", "${model.street}", "${model.city}" '
          ',"${model.buildingNumber}")').then((value) {

        print('address inserted success');
        // emit(AppInsertDatabaseState());
        getAddressFromDatabase(database, token);
      }).catchError((error){});

    });
  }

  void updateAddress(AddressModel model, String token)
  async {
    database.rawUpdate(
      'UPDATE address SET Street = ?, City = ?, Building = ? WHERE UserId = ?',
      [model.street, model.city, model.buildingNumber, token],
    ).then((value) {
      getAddressFromDatabase(database, token);
      // emit(AppUpdateDatabaseState());
    });
  }

  ///////////////////////////////////////////////////////////////

}