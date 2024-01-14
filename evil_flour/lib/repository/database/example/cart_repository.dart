import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:evil_flour/repository/database/example/buyable_item.dart';
import 'package:evil_flour/repository/database/example/shopping_cart.dart';
import 'package:evil_flour/repository/database/flour.dart';
import 'package:evil_flour/repository/database/connection/connection.dart'
    as impl;
part 'cart_repository.g.dart';

typedef ShoppingCartWithItems = ({
  ShoppingCart cart,
  List<BuyableItem> items,
});

@DriftDatabase(tables: [ShoppingCart, BuyableItem])
abstract class CartRepository extends _$CartRepository {
  CartRepository() : super(impl.connect());

  CartRepository.forTesting(DatabaseConnection connection) : super(connection);

  @override
  int get schemaVersion => 1;

  Future<void> updateCart(ShoppingCartWithItems entry) {
    return transaction(() async {
      final cart = entry.cart;

      // first, we write the shopping cart
      await update(shoppingCart).replace(entry.cart);

      // we replace the entries of the cart, so first delete the old ones
      await (delete(shoppingCartEntries)
            ..where((entry) => entry.shoppingCart.equals(cart.id)))
          .go();

      // And write the new ones
      for (final item in entry.items) {
        await into(shoppingCartEntries)
            .insert(ShoppingCartEntry(shoppingCart: cart.id, item: item.id));
      }
    });
  }
}
