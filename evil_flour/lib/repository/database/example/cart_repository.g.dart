// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_repository.dart';

// ignore_for_file: type=lint
class $ShoppingCartTable extends ShoppingCart
    with TableInfo<$ShoppingCartTable, ShoppingCartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingCartTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_cart';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingCartData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingCartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingCartData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $ShoppingCartTable createAlias(String alias) {
    return $ShoppingCartTable(attachedDatabase, alias);
  }
}

class ShoppingCartData extends DataClass
    implements Insertable<ShoppingCartData> {
  final int id;
  const ShoppingCartData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  ShoppingCartCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartCompanion(
      id: Value(id),
    );
  }

  factory ShoppingCartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  ShoppingCartData copyWith({int? id}) => ShoppingCartData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartData && other.id == this.id);
}

class ShoppingCartCompanion extends UpdateCompanion<ShoppingCartData> {
  final Value<int> id;
  const ShoppingCartCompanion({
    this.id = const Value.absent(),
  });
  ShoppingCartCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<ShoppingCartData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  ShoppingCartCompanion copyWith({Value<int>? id}) {
    return ShoppingCartCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $BuyableItemTable extends BuyableItem
    with TableInfo<$BuyableItemTable, BuyableItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BuyableItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description, price];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'buyable_item';
  @override
  VerificationContext validateIntegrity(Insertable<BuyableItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BuyableItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BuyableItemData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $BuyableItemTable createAlias(String alias) {
    return $BuyableItemTable(attachedDatabase, alias);
  }
}

class BuyableItemData extends DataClass implements Insertable<BuyableItemData> {
  final int id;
  final String description;
  final int price;
  const BuyableItemData(
      {required this.id, required this.description, required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    map['price'] = Variable<int>(price);
    return map;
  }

  BuyableItemCompanion toCompanion(bool nullToAbsent) {
    return BuyableItemCompanion(
      id: Value(id),
      description: Value(description),
      price: Value(price),
    );
  }

  factory BuyableItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BuyableItemData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<int>(price),
    };
  }

  BuyableItemData copyWith({int? id, String? description, int? price}) =>
      BuyableItemData(
        id: id ?? this.id,
        description: description ?? this.description,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('BuyableItemData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BuyableItemData &&
          other.id == this.id &&
          other.description == this.description &&
          other.price == this.price);
}

class BuyableItemCompanion extends UpdateCompanion<BuyableItemData> {
  final Value<int> id;
  final Value<String> description;
  final Value<int> price;
  const BuyableItemCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
  });
  BuyableItemCompanion.insert({
    this.id = const Value.absent(),
    required String description,
    required int price,
  })  : description = Value(description),
        price = Value(price);
  static Insertable<BuyableItemData> custom({
    Expression<int>? id,
    Expression<String>? description,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
    });
  }

  BuyableItemCompanion copyWith(
      {Value<int>? id, Value<String>? description, Value<int>? price}) {
    return BuyableItemCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BuyableItemCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

abstract class _$CartRepository extends GeneratedDatabase {
  _$CartRepository(QueryExecutor e) : super(e);
  late final $ShoppingCartTable shoppingCart = $ShoppingCartTable(this);
  late final $BuyableItemTable buyableItem = $BuyableItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [shoppingCart, buyableItem];
}
