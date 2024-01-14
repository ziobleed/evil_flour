import 'package:drift/drift.dart';

class Flour extends Table {
  IntColumn id() => integer().autoIncrement()();
  TextColumn name() => text()();
  TextColumn description() => text()();
}
