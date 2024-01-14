import 'package:drift/drift.dart';
import 'package:evil_flour/repository/database/flour.dart';
import 'package:evil_flour/repository/database/product.dart';

@DataClassName('ProductFlour')
class ProductFlour extends Table {
  // id of the product that should contain flour.
  IntColumn get product => integer().references(Product, #id)();
  // id of the flour associated with product
  IntColumn get flour => integer().references(Flour, #id)();

  // again, we could store additional information like when the item was
  // added, an amount, etc
}
