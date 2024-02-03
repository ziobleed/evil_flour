import 'models/product_item.dart';
import 'models/flour.dart';

abstract class Repository {
// Find methods
// 1

  Future<List<ProductItem>> findAllProducts();
  Stream<List<ProductItem>> watchAllProducts();
  // 2
  ProductItem findProductById(int productId);
  // 3
  Future<List<Flour>> findAllFlours();
  Stream<List<Flour>> watchAllFlours();
  // 4
  List<Flour> findProductFlours(int productId);

// Insert methods
  int insertProduct(ProductItem product);
// 6
  List<int> insertFlours(List<Flour> flours);

// Delete methods
// 7
  void deleteProduct(ProductItem product);
// 8
  void deleteFlour(Flour flour);
// 9
  void deleteFlours(List<Flour> flours);

// Initializing and closing methods
// 11
  Future init();
// 12
  void close();
}
