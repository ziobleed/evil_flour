class Flour {
  int id;
  String name;
  String description;

  Flour({required this.id, required this.name, required this.description});

// produce un nuovo oggetto ProductItem copiando l'oggetto corrente e
  // aggiornando solo i campi passati come parametri
  Flour copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Flour(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description);
  }

  // Create a Flour from JSON data
  factory Flour.fromJson(Map<String, dynamic> json) => Flour(
        id: json['id'],
        name: json['name'],
        description: json['description'],
      );

  // Flour to JSON
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
      };
}
