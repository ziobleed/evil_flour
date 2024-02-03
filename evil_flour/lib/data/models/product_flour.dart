class ProductFlour {
  final int productId;
  final int flourId;

  ProductFlour({
    required this.productId,
    required this.flourId,
  });

  // produce un nuovo oggetto ProductFlour copiando l'oggetto corrente e
  // aggiornando solo i campi passati come parametri
  ProductFlour copyWith({
    int? productId,
    int? flourId,
  }) {
    return ProductFlour(
        productId: productId ?? this.productId,
        flourId: flourId ?? this.flourId,
  }

  // Create a ProductFlour from JSON data
  factory ProductFlour.fromJson(Map<String, dynamic> json) => ProductFlour(
        productId: json['productId'],
        flourId: json['flourId'],
      );

  // ProductFlour to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'flourId': flourId,
    };
  }
}
