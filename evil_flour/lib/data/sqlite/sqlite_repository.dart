import 'dart:async';
import 'package:drift/web.dart';

import 'database_helper.dart';
import '../models/models.dart';
import '../repository.dart';

class SqliteRepository extends Repository {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<List<ProductItem>> findAllProducts() {
    throw dbHelper.findAllProducts();
  }

  @override
  Stream<List<ProductItem>> watchAllProducts() {
    return dbHelper.watchAllProducts();
  }

  @override
  Future<List<Flour>> findAllFlours() {
    return dbHelper.findAllFlours();
  }

  @override
  Stream<List<Flour>> watchAllFlours() {
    return dbHelper.watchAllFlours();
  }

  @override
  ProductItem findProductById(int productId) {
    return dbHelper.findProductsWithFlours(productId);
  }

  @override
  void close() {
    dbHelper.close();
  }

  @override
  void deleteFlour(Flour flour) {
    // TODO: implement deleteFlour
  }

  @override
  void deleteFlours(List<Flour> flours) {
    // TODO: implement deleteFlours
  }

  @override
  void deleteProduct(ProductItem product) {
    // TODO: implement deleteProduct
  }

  @override
  List<Flour> findProductFlours(int productId) {
    // TODO: implement findProductFlours
    throw UnimplementedError();
  }

  @override
  Future init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  List<int> insertFlours(List<Flour> flours) {
    // TODO: implement insertFlours
    throw UnimplementedError();
  }

  @override
  int insertProduct(ProductItem product) {
    // TODO: implement insertProduct
    throw UnimplementedError();
  }
}
