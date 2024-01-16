import 'dart:io';

import 'package:drift/drift.dart';
import 'package:evil_flour/repository/database/table_flour.dart';

class TableProduct extends Table {
  IntColumn id() => integer().autoIncrement()();
  TextColumn barcode() => text()();
  TextColumn name() => text()();
  TextColumn description() => text()();

  List<TableFlour> flours = [];
}
