import 'package:drift/drift.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlbrite/sqlbrite.dart';
import 'package:synchronized/synchronized.dart';
import '../models/models.dart';

class DatabaseHelper {
  // database name and version
  static const _databaseName = 'evilproducts.db';
  static const _databaseVersion = 1;

  // tables names
  static const productTable = 'Product';
  static const flourTable = 'Flour';
  static const productFlourTable = 'Product_Flour';
  static const productId = 'productId';
  static const flourId = 'flourId';

  // sqlbrite, accesso via stream
  static late BriteDatabase _streamDatabase;

  // questa è una classe singleton
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // usato per prevenire un accesso concorrente
  static var lock = Lock();

  // una reference al database singola e per tutta l'applicazione
  static Database? _database;

  // SQL code to create the database table
  // la firma di questo metodo deve rispettare quella definita in sqlite_api.dart :FutureOr<void> Function(Database db, int version);
  Future _onCreate(Database db, int version) async {
    // crea la tabella Product
    await db.execute('''
          CREATE TABLE $productTable (
            $productId INTEGER PRIMARY KEY,
            barcode TEXT,
            name TEXT,
            description TEXT
          )
      ''');

    // crea la tabella Flour
    await db.execute('''
          CREATE TABLE $flourTable (
            $flourId INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT
          )
      ''');

    // crea la tabella di raccordo molti a molti Product_Flour
    await db.execute('''
          CREATE TABLE $productFlourTable (
            $productId INTEGER REFERENCES $productTable($productId),
            $flourId INTEGER REFERENCES $flourTable($flourId)
          )
      ''');
  }

  // apre il database
  Future<Database> _initDatabase() async {
    // ottiene la posizione del file evilproducts.db
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(
      documentsDirectory.path,
      _databaseName,
    );

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // Initialize getter here
  // ritorna il database (wrappato in un BriteDatabase). Lo inizializza se necessario
  Future<Database> get database async {
    // se il database è già inizializzato, ritornalo
    if (_database != null) return _database!;
    // inizalizza il database, in un blocco syncronized per evitare accesso concorrente
    await lock.synchronized(() async {
      if (_database == null) {
        // inizializza il database
        _database = await _initDatabase();
        // wrappalo in un BriteDatabase.
        // il BriteDatabase permete di accedere al db con una struttura ad eventi
        _streamDatabase = BriteDatabase(_database!);
      }
    });
    return _streamDatabase;
  }

  // getter per il database nella sua versione "Stream"
  Future<BriteDatabase> get streamDatabase async {
    await database;
    return _streamDatabase;
  }

  List<ProductItem> parseProductItemsWithFlours(
      List<Map<String, dynamic>> productList) {
    // l'obiettivo è leggere un json che ha
    // - un prodotto
    // - una sua farina associata
    // Poiché un prodotto può avere più farine, più righe json possono afferire
    // allo stesso prodotto ma farina diversa.
    // Quindi per recuperare un prodotto che già ho iniziato a valorizzare
    // lo metto in una mappa e uso il product id per recuperarlo
    // poi gli aggiungo la farina

    Map<int, ProductItem> productsMap = {};
    for (final Map<String, dynamic> currJson in productList) {
      int currProductId = currJson['productId'];
      // se il prodotto non è nella mappa, lo creo leggendo parte del json e
      // lo inserisco nella mappa
      productsMap[currProductId] ??= ProductItem(
          id: currJson['productId'],
          barcode: currJson['barcode'],
          name: currJson['productName'],
          description: currJson['productDescription']);

      // estraggo il prodotto dalla mappa dei prodotti e ci aggiungo la farina
      ProductItem currProduct = productsMap[currProductId]!;
      // creo la farina
      Flour currFlour = Flour(
          id: currJson['flourId'],
          name: currJson['flourName'],
          description: currJson['flourDescription']);
      // la aggiungo al prodotto
      currProduct.flours.add(currFlour);
    }
    // traduco in lista il contenuto della mappa dei prodotti
    return productsMap.entries.map((entry) => entry.value).toList();
  }

  List<ProductItem> parseProductItems(
      List<Map<String, dynamic>> productListWithFlours) {
    List<ProductItem> products = <ProductItem>[];
    for (final Map<String, dynamic> currJson in productListWithFlours) {
      final ProductItem productItem = ProductItem.fromJson(currJson);
      products.add(productItem);
    }
    return products;
  }

  // Add parseFlours
  List<Flour> parseFlours(List<Map<String, dynamic>> flourList) {
    List<Flour> flours = <Flour>[];
    for (final Map<String, dynamic> currJsonFlour in flourList) {
      final Flour flour = Flour.fromJson(currJsonFlour);
      flours.add(flour);
    }
    return flours;
  }

  // metodo parseFlours scritto in modo piu sintetico usando stream con map
  List<Flour> parseFlours2(List<Map<String, dynamic>> flourList) {
    return flourList.map((json) => Flour.fromJson(json)).toList();
  }

  Future<List<ProductItem>> findAllProducts() async {
    final BriteDatabase db = await instance.streamDatabase;
    List<Map<String, dynamic>> productList = await db.query(productTable);
    return parseProductItems(productList);
  }

  Future<List<Flour>> findAllFlours() async {
    final BriteDatabase db = await instance.streamDatabase;
    List<Map<String, dynamic>> flourList = await db.query(flourTable);
    return parseFlours(flourList);
  }

  Stream<List<ProductItem>> watchAllProducts() async* {
    final BriteDatabase db = await instance.streamDatabase;
    yield* db
        .createQuery(productTable)
        .mapToList((row) => ProductItem.fromJson(row));
  }

  Stream<List<Flour>> watchAllFlours() async* {
    final BriteDatabase db = await instance.streamDatabase;
    yield* db.createQuery(flourTable).mapToList((row) => Flour.fromJson(row));
  }

  Future<List<ProductItem>> findProductsWithFlours(int productId) async {
    String query = '''
      SELECT 
        p.$productId AS productId,
        p.barcode AS barcode,
        p.name AS productName,
        p.description AS productDescription,
        f.$flourId AS flourId,
        f.name AS flourName,
        f.description AS flourDescription
      FROM $productTable p
        JOIN $productFlourTable pf ON p.$productId = pf.$productId
        JOIN $flourTable f ON pf.$flourId = f.$flourId
    GROUP BY p.$productId
    ORDER BY p.name
    ''';
    final BriteDatabase db = await instance.streamDatabase;
    List<Map<String, dynamic>> productsWithFloursList =
        await db.rawQuery(query);

    // trasformo i json ottenuti dal db in ProductItems
    return productsWithFloursList
        .map((json) => ProductItem.fromJsonWithFlours(json))
        .toList();
  }

  // metodo generico per inserire un record semplice in una tabella
  Future<int> insert(String table, Map<String, dynamic> row) async {
    final BriteDatabase db = await instance.streamDatabase;
    return db.insert(
      table,
      row,
    );
  }

  // inserisce un prodotto semplice, senza inserire i Flour corrispondenti
  Future<int> insertProduct(ProductItem product) async {
    final BriteDatabase db = await instance.streamDatabase;
    return db.insert(
      productTable,
      product.toJson(),
    );
  }

  // inserisce un prodotto semplice, senza inserire i Flour corrispondenti
  Future<int> insertFlour(Flour flour) async {
    final BriteDatabase db = await instance.streamDatabase;
    return db.insert(
      flourTable,
      flour.toJson(),
    );
  }

  // inserisce un prodotto completo, comprensivo di farine
  // return the id of the product
  Future<int> insertProductWithFlours(ProductItem product) async {
    final BriteDatabase db = await instance.streamDatabase;
    // apro una transazione
    return db.transaction((txn) async {
      // Inserisco il prodotto
      int productId = await txn.insert(productTable, product.toJson());
      // leggo le farine associate
      for (Flour currFlour in product.flours) {
        // associo le farine al prodotto sul db

        Map<String, Object?> row = {
          "productId": productId,
          "flourId": currFlour.id
        };
        txn.insert(productFlourTable, row);
      }
      return productId;
    });
  }

  // metodo per cancellare un record da una tabella, ritorna il numero di record cancellati
  Future<int> delete(String table, String byColumn, int whereValue) async {
    final BriteDatabase db = await instance.streamDatabase;
    return db.delete(
      table,
      where: '$byColumn = ?',
      whereArgs: [whereValue],
    );
  }
// metodo per cancellare un record da una tabella, in transazione, ritorna il numero di record cancellati

  Future<int> deleteInTransaction({
    required Transaction transaction,
    required String table,
    required String byColumn,
    required int whereValue,
  }) async {
    return txn.delete(
      table,
      where: '$byColumn = ?',
      whereArgs: [whereValue],
    );
  }

  Future<int> deleteProduct(ProductItem product) async {
    final BriteDatabase db = await instance.streamDatabase;
    int recordCancellati = 0;
    // apro una transazione
    db.transaction((txn) async {
      // cancello il record della tabella di raccordo
      await deleteInTransaction(
        transaction: txn,
        table: productFlourTable,
        byColumn: productId,
        whereValue: product.id,
      );
      // cancello record sulla tabella product
      recordCancellati = await deleteInTransaction(
        transaction: txn,
        table: productTable,
        byColumn: productId,
        whereValue: product.id,
      );
    });
    return recordCancellati;
  }

  Future<int> deleteFlour(Flour flour) async {
    final BriteDatabase db = await instance.streamDatabase;
    int recordCancellati = 0;
    // cancello il record della tabella di raccordo
    db.transaction((txn) async {
      await deleteInTransaction(
        transaction: txn,
        table: productFlourTable,
        byColumn: flourId,
        whereValue: flour.id,
      );
      // cancello record sulla tabella flour
      recordCancellati = await deleteInTransaction(
        transaction: txn,
        table: productTable,
        byColumn: flourId,
        whereValue: flour.id,
      );
    });
    return recordCancellati;
  }

  // Close the database
  void close() {
    _streamDatabase.close();
  }
}
