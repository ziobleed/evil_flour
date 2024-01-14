import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:evil_flour/repository/database/flour.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

class Product extends Table {
  IntColumn id() => integer().autoIncrement()();
  TextColumn barcode() => text()();
  TextColumn name() => text()();
  TextColumn description() => text()();

  List<Flour> flours = [];
}
