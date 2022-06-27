abstract class ShoppingCardStates {}

class ShoppingInitialState extends ShoppingCardStates{}

class ShoppingCreateDatabaseState extends ShoppingCardStates{}

class ShoppingGetDatabaseState extends ShoppingCardStates{}

class ShoppingDeleteDatabaseState extends ShoppingCardStates{}

class ShoppingDeleteProductDatabaseState extends ShoppingCardStates{}

class ShoppingInsertDatabaseState extends ShoppingCardStates{}

class ShoppingUpdateDatabaseState extends ShoppingCardStates{}

class ShoppingMinusState extends ShoppingCardStates{}

class ShoppingPlusState extends ShoppingCardStates{}

class ShoppingDeletFromShoppingCardState extends ShoppingCardStates{}

class ShoppingsubTotalState extends ShoppingCardStates{
 final double subTotal ;

  ShoppingsubTotalState(this.subTotal);
}

