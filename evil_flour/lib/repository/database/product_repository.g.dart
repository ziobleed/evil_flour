// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_repository.dart';

// ignore_for_file: type=lint
class $ProductTable extends Product with TableInfo<$ProductTable, ProductData>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$ProductTable(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'product';
@override
VerificationContext validateIntegrity(Insertable<ProductData> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override ProductData map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return ProductData();
}
@override
$ProductTable createAlias(String alias) {
return $ProductTable(attachedDatabase, alias);}}class ProductData extends DataClass implements Insertable<ProductData> {
const ProductData({});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};return map; 
}
ProductCompanion toCompanion(bool nullToAbsent) {
return ProductCompanion();
}
factory ProductData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return ProductData();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}ProductData copyWith({}) => ProductData();@override
String toString() {return (StringBuffer('ProductData(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is ProductData);
}class ProductCompanion extends UpdateCompanion<ProductData> {
final Value<int> rowid;
const ProductCompanion({this.rowid = const Value.absent(),});
ProductCompanion.insert({this.rowid = const Value.absent(),});
static Insertable<ProductData> custom({Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (rowid != null)'rowid': rowid,});
}ProductCompanion copyWith({Value<int>? rowid}) {
return ProductCompanion(rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('ProductCompanion(')..write('rowid: $rowid')..write(')')).toString();}
}
class $FlourTable extends Flour with TableInfo<$FlourTable, FlourData>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$FlourTable(this.attachedDatabase, [this._alias]);
@override
List<GeneratedColumn> get $columns => [];
@override
String get aliasedName => _alias ?? actualTableName;
@override
 String get actualTableName => $name;
static const String $name = 'flour';
@override
VerificationContext validateIntegrity(Insertable<FlourData> instance, {bool isInserting = false}) {
final context = VerificationContext();
final data = instance.toColumns(true);
return context;
}
@override
Set<GeneratedColumn> get $primaryKey => const {};@override FlourData map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return FlourData();
}
@override
$FlourTable createAlias(String alias) {
return $FlourTable(attachedDatabase, alias);}}class FlourData extends DataClass implements Insertable<FlourData> {
const FlourData({});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};return map; 
}
FlourCompanion toCompanion(bool nullToAbsent) {
return FlourCompanion();
}
factory FlourData.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return FlourData();}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
};}FlourData copyWith({}) => FlourData();@override
String toString() {return (StringBuffer('FlourData(')..write(')')).toString();}
@override
 int get hashCode => identityHashCode(this);@override
bool operator ==(Object other) => identical(this, other) || (other is FlourData);
}class FlourCompanion extends UpdateCompanion<FlourData> {
final Value<int> rowid;
const FlourCompanion({this.rowid = const Value.absent(),});
FlourCompanion.insert({this.rowid = const Value.absent(),});
static Insertable<FlourData> custom({Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (rowid != null)'rowid': rowid,});
}FlourCompanion copyWith({Value<int>? rowid}) {
return FlourCompanion(rowid: rowid ?? this.rowid,);
}
@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};if (rowid.present) {
map['rowid'] = Variable<int>(rowid.value);}
return map; 
}
@override
String toString() {return (StringBuffer('FlourCompanion(')..write('rowid: $rowid')..write(')')).toString();}
}
class $ProductFlourTable extends ProductFlour with TableInfo<$ProductFlourTable, ProductFlour>{
@override final GeneratedDatabase attachedDatabase;
final String? _alias;
$ProductFlourTable(this.attachedDatabase, [this._alias]);
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
static const String $name = 'product_flour';
@override
VerificationContext validateIntegrity(Insertable<ProductFlour> instance, {bool isInserting = false}) {
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
Set<GeneratedColumn> get $primaryKey => const {};@override ProductFlour map(Map<String, dynamic> data, {String? tablePrefix})  {
final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';return ProductFlour(product: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}product'])!, flour: attachedDatabase.typeMapping.read(DriftSqlType.int, data['${effectivePrefix}flour'])!, );
}
@override
$ProductFlourTable createAlias(String alias) {
return $ProductFlourTable(attachedDatabase, alias);}}class ProductFlour extends DataClass implements Insertable<ProductFlour> {
final int product;
final int flour;
const ProductFlour({required this.product, required this.flour});@override
Map<String, Expression> toColumns(bool nullToAbsent) {
final map = <String, Expression> {};map['product'] = Variable<int>(product);
map['flour'] = Variable<int>(flour);
return map; 
}
ProductFlourCompanion toCompanion(bool nullToAbsent) {
return ProductFlourCompanion(product: Value(product),flour: Value(flour),);
}
factory ProductFlour.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return ProductFlour(product: serializer.fromJson<int>(json['product']),flour: serializer.fromJson<int>(json['flour']),);}
@override Map<String, dynamic> toJson({ValueSerializer? serializer}) {
serializer ??= driftRuntimeOptions.defaultSerializer;
return <String, dynamic>{
'product': serializer.toJson<int>(product),'flour': serializer.toJson<int>(flour),};}ProductFlour copyWith({int? product,int? flour}) => ProductFlour(product: product ?? this.product,flour: flour ?? this.flour,);@override
String toString() {return (StringBuffer('ProductFlour(')..write('product: $product, ')..write('flour: $flour')..write(')')).toString();}
@override
 int get hashCode => Object.hash(product, flour);@override
bool operator ==(Object other) => identical(this, other) || (other is ProductFlour && other.product == this.product && other.flour == this.flour);
}class ProductFlourCompanion extends UpdateCompanion<ProductFlour> {
final Value<int> product;
final Value<int> flour;
final Value<int> rowid;
const ProductFlourCompanion({this.product = const Value.absent(),this.flour = const Value.absent(),this.rowid = const Value.absent(),});
ProductFlourCompanion.insert({required int product,required int flour,this.rowid = const Value.absent(),}): product = Value(product), flour = Value(flour);
static Insertable<ProductFlour> custom({Expression<int>? product, 
Expression<int>? flour, 
Expression<int>? rowid, 
}) {
return RawValuesInsertable({if (product != null)'product': product,if (flour != null)'flour': flour,if (rowid != null)'rowid': rowid,});
}ProductFlourCompanion copyWith({Value<int>? product, Value<int>? flour, Value<int>? rowid}) {
return ProductFlourCompanion(product: product ?? this.product,flour: flour ?? this.flour,rowid: rowid ?? this.rowid,);
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
String toString() {return (StringBuffer('ProductFlourCompanion(')..write('product: $product, ')..write('flour: $flour, ')..write('rowid: $rowid')..write(')')).toString();}
}
abstract class _$ProductRepository extends GeneratedDatabase{
_$ProductRepository(QueryExecutor e): super(e);
late final $ProductTable product = $ProductTable(this);
late final $FlourTable flour = $FlourTable(this);
late final $ProductFlourTable productFlour = $ProductFlourTable(this);
@override
Iterable<TableInfo<Table, Object?>> get allTables => allSchemaEntities.whereType<TableInfo<Table, Object?>>();
@override
List<DatabaseSchemaEntity> get allSchemaEntities => [product, flour, productFlour];
}
