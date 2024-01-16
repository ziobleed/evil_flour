// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_repository.dart';

// ignore_for_file: type=lint
class $TableProductTable extends TableProduct with TableInfo<$TableProductTable, TableProductData>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$TableProductTable(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'table_product';
@override
VerificationContext validateIntegrity(Insertable<TableProductData> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override TableProductData map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return TableProductData();
}
@override
$TableProductTable createAlias(String alias) {
return $TableProductTable(attachedDatabase, alias);}}class TableProductData extends DataClass implements Insertable<TableProductData> {
const TableProductData({});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};return map; 
}
TableProductCompanion toCompanion(bool nullToAbsent) {
return TableProductCompanion();
}
factory TableProductData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return TableProductData();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}TableProductData copyWith({}) => TableProductData();@override
String toString() {return (StringBuffer('TableProductData(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is TableProductData);
}class TableProductCompanion extends UpdateCompanion<TableProductData> {
final Value<int> rowid;
const TableProductCompanion({this.rowid = const Value.absent(),});
TableProductCompanion.insert({this.rowid = const Value.absent(),});
static Insertable<TableProductData> custom({Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (rowid != null)'rowid': rowid,});
}TableProductCompanion copyWith({Value<int>? rowid}) {
return TableProductCompanion(rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('TableProductCompanion(')..write('rowid: $rowid')..write(')')).toString();}
}
class $TableFlourTable extends TableFlour with TableInfo<$TableFlourTable, TableFlourData>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$TableFlourTable(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'table_flour';
@override
VerificationContext validateIntegrity(Insertable<TableFlourData> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override TableFlourData map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return TableFlourData();
}
@override
$TableFlourTable createAlias(String alias) {
return $TableFlourTable(attachedDatabase, alias);}}class TableFlourData extends DataClass implements Insertable<TableFlourData> {
const TableFlourData({});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};return map; 
}
TableFlourCompanion toCompanion(bool nullToAbsent) {
return TableFlourCompanion();
}
factory TableFlourData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return TableFlourData();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}TableFlourData copyWith({}) => TableFlourData();@override
String toString() {return (StringBuffer('TableFlourData(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is TableFlourData);
}class TableFlourCompanion extends UpdateCompanion<TableFlourData> {
final Value<int> rowid;
const TableFlourCompanion({this.rowid = const Value.absent(),});
TableFlourCompanion.insert({this.rowid = const Value.absent(),});
static Insertable<TableFlourData> custom({Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (rowid != null)'rowid': rowid,});
}TableFlourCompanion copyWith({Value<int>? rowid}) {
return TableFlourCompanion(rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('TableFlourCompanion(')..write('rowid: $rowid')..write(')')).toString();}
}
class $TableProductFlourTable extends TableProductFlour with TableInfo<$TableProductFlourTable, TableProductFlourData>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$TableProductFlourTable(this.attachedDatabase, [this._alias]);
static const VerificationMeta _productMeta = const VerificationMeta('product');
@override
late final GeneratedColumn<int> product = GeneratedColumn<int>('product', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
static const VerificationMeta _flourMeta = const VerificationMeta('flour');
@override
late final GeneratedColumn<int> flour = GeneratedColumn<int>('flour', aliasedName, false, type: DriftSqlType.int, requiredDuringInsert: true);
@override
List<GeneratedColumn> get $columns => [product, flour];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'table_product_flour';
@override
VerificationContext validateIntegrity(Insertable<TableProductFlourData> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
if (data.containsKey('product')) {
context.handle(_productMeta, product.isAcceptableOrUnknown(data['product']!, _productMeta));} else if (isInserting) {
context.missing(_productMeta);
}
if (data.containsKey('flour')) {
context.handle(_flourMeta, flour.isAcceptableOrUnknown(data['flour']!, _flourMeta));} else if (isInserting) {
context.missing(_flourMeta);
}
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override TableProductFlourData map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return TableProductFlourData(product: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}product'])!, flour: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}flour'])!, );
}
@override
$TableProductFlourTable createAlias(String alias) {
return $TableProductFlourTable(attachedDatabase, alias);}}class TableProductFlourData extends DataClass implements Insertable<TableProductFlourData> {
final int product;
final int flour;
const TableProductFlourData({required this.product, required this.flour});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['product'] = Variable<int>(product);
map['flour'] = Variable<int>(flour);
return map; 
}
TableProductFlourCompanion toCompanion(bool nullToAbsent) {
return TableProductFlourCompanion(product: Value(product),flour: Value(flour),);
}
factory TableProductFlourData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return TableProductFlourData(product: serializer.fromJson<int>(json['product']),flour: serializer.fromJson<int>(json['flour']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'product': serializer.toJson<int>(product),'flour': serializer.toJson<int>(flour),};}TableProductFlourData copyWith({int? product,int? flour}) => TableProductFlourData(product: product ?? this.product,flour: flour ?? this.flour,);@override
String toString() {return (StringBuffer('TableProductFlourData(')..write('product: $product, ')..write('flour: $flour')..write(')')).toString();}
@override
 int get hashCode => Object.hash(product, flour);@override
bool operator ==(Object other) => identical(this, other) || (other is TableProductFlourData && other.product == this.product && other.flour == this.flour);
}class TableProductFlourCompanion extends UpdateCompanion<TableProductFlourData> {
final Value<int> product;
final Value<int> flour;
final Value<int> rowid;
const TableProductFlourCompanion({this.product = const Value.absent(),this.flour = const Value.absent(),this.rowid = const Value.absent(),});
TableProductFlourCompanion.insert({required int product,required int flour,this.rowid = const Value.absent(),}): product = Value(product), flour = Value(flour);
static Insertable<TableProductFlourData> custom({Expression<int>? product, 
Expression<int>? flour, 
Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (product != null)'product': product,if (flour != null)'flour': flour,if (rowid != null)'rowid': rowid,});
}TableProductFlourCompanion copyWith({Value<int>? product, Value<int>? flour, Value<int>? rowid}) {
return TableProductFlourCompanion(product: product ?? this.product,flour: flour ?? this.flour,rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (product.present) {
map['product'] = Variable<int>(product.value);}
if (flour.present) {
map['flour'] = Variable<int>(flour.value);}
if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('TableProductFlourCompanion(')..write('product: $product, ')..write('flour: $flour, ')..write('rowid: $rowid')..write(')')).toString();}
}
abstract class _$ProductRepository extends GeneratedDatabase{
_$ProductRepository(QueryExecutor e): super(e);
late final $TableProductTable tableProduct = $TableProductTable(this);
late final $TableFlourTable tableFlour = $TableFlourTable(this);
late final $TableProductFlourTable tableProductFlour = $TableProductFlourTable(this);
late final ProductDao productDao = ProductDao(this as ProductRepository);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [tableProduct, tableFlour, tableProductFlour];
}
mixin _$ProductDaoMixin on DatabaseAccessor<ProductRepository> {
$TableProductTable get tableProduct =>
attachedDatabase.tableProduct;
}
