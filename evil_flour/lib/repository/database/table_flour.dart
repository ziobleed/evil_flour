import 'package:drift/drift.dart';

class TableFlour extends Table {
  IntColumn id() => integer().autoIncrement()();
  TextColumn name() => text()();
  TextColumn description() => text()();
}
