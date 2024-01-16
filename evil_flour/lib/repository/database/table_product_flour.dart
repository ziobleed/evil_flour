import 'package:drift/drift.dart';
import 'package:evil_flour/repository/database/table_flour.dart';
import 'package:evil_flour/repository/database/table_product.dart';

class TableProductFlour extends Table {
  // id of the product that should contain flour.
  IntColumn get product => integer().references(TableProduct, #id)();
  // id of the flour associated with product
  IntColumn get flour => integer().references(TableFlour, #id)();

  // again, we could store additional information like when the item was
  // added, an amount, etc
}
