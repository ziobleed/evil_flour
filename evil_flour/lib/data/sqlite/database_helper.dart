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
  static const producTable = 'Product';
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
          CREATE TABLE $producTable (
            $productId INTEGER PRIMARY KEY,
            barcode TEXT,
            name TEXT,
            description TEXT
          )
      ''');

    // crea la tabella Flour
    await db.execute('''
          CREATE TABLE $productFlourTable (
            $flourId INTEGER PRIMARY KEY,
            name TEXT,
            description TEXT
          )
      ''');

    // crea la tabella di raccordo molti a molti Product_Flour
    await db.execute('''
          CREATE TABLE $productFlourTable (
            $productId INTEGER REFERENCES $producTable($productId),
            $flourId INTEGER REFERENCES $productFlourTable($flourId)
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

  // Add parseProduct_items
  List<ProductItem> parseProductItems(List<Map<String, dynamic>> productList) {
    List<ProductItem> products = <ProductItem>[];
    for (final Map<String, dynamic> currJsonProductItem in productList) {
      final ProductItem productItem = ProductItem.fromJson(currJsonProductItem);
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
}
