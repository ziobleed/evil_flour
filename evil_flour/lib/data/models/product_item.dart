import 'package:evil_flour/data/models/flour.dart';

class ProductItem {
  final int id;
  final String barcode;
  final String name;
  final String description;
  List<Flour> flours = [];

  ProductItem({
    required this.id,
    required this.barcode,
    required this.name,
    required this.description,
  });

  // produce un nuovo oggetto ProductItem copiando l'oggetto corrente e
  // aggiornando solo i campi passati come parametri
  ProductItem copyWith({
    int? id,
    String? barcode,
    String? name,
    String? description,
  }) {
    return ProductItem(
        id: id ?? this.id,
        barcode: barcode ?? this.barcode,
        name: name ?? this.name,
        description: description ?? this.description);
  }

  // Create a ProductItem from JSON data
  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json['id'],
        barcode: json['barcode'],
        name: json['name'],
        description: json['description'],
      );

  // ProductItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'barcode': barcode,
      'name': name,
      'description': description,
    };
  }
}
