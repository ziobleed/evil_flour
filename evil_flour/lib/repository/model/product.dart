import 'package:evil_flour/repository/model/flour.dart';

class Product {
  int pk = 0;
  String barcode = '';
  String name = '';
  String description = '';
  List<Flour> composition = [];

  Product({pk, barcode, name, description}) : composition = [];
}
