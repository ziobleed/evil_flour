import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:evil_flour/repository/database/table_flour.dart';
import 'package:evil_flour/repository/database/table_product.dart';
import 'package:evil_flour/repository/database/table_product_flour.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'product_repository.g.dart';

@DriftDatabase(
    tables: [TableProduct, TableFlour, TableProductFlour], daos: [ProductDao])
class ProductRepository extends _$ProductRepository {
  ProductRepository() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
// Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;
    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}

// Dao della tabella Product
@DriftAccessor(tables: [TableProduct])
class ProductDao extends DatabaseAccessor<ProductRepository>
    with _$ProductDaoMixin {
  final ProductRepository db;
  ProductDao(this.db) : super(db);

  // FIND ALL PRODUCTS
  Future<List<TableProductData>> findAllProducts() =>
      select(tableProduct).get();

  // 5
  Stream<List<TableProduct>> watchAllProducts() {
    // TODO: Add watchAllRecipes code here
    throw Exception("Not implemented yet");
  }

  // FIND PRODUCT BY ID
  Future<List<TableProductData>> findProductById(int id) =>
      (select(tableProduct)..where((t) => t.id().equals(id))).get();

  // 7 INSERT A NEW PRODUCT
  Future<int> insertProduct(Insertable<TableProductData> newProduct) =>
      into(tableProduct).insert(newProduct);

  // 8 DELETE A PRODUCT
  Future deleteProduct(int id) => Future.value(
      (delete(tableProduct)..where((tbl) => tbl.id().equals(id))).go());
}
