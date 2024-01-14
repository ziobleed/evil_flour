import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:evil_flour/repository/database/example/shopping_cart.dart';
import 'package:evil_flour/repository/database/flour.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

class BuyableItem extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get description => text()();
  IntColumn get price => integer()();
  // we could add more columns as we wish.
}
