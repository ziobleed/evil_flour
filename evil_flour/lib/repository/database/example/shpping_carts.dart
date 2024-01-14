class ShoppingCarts extends Table {
  IntColumn get id => integer().autoIncrement()();
  // we could also store some further information about the user creating
  // this cart etc.
}

@DataClassName('ShoppingCartEntry')
class ShoppingCartEntries extends Table {
  // id of the cart that should contain this item.
  IntColumn get shoppingCart => integer().references(ShoppingCarts, #id)();
  // id of the item in this cart
  IntColumn get item => integer().references(BuyableItems, #id)();
  // again, we could store additional information like when the item was
  // added, an amount, etc.
}
