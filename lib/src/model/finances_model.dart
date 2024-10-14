class FinancesModel {
  final BigInt? id;
  final String description;
  final double value;
  final String date;
  //final bool? fixed; // gasto fixo
  final String category;
  final String wayToreceive; // pix, especie
  final String type; // entrada ou siada

  FinancesModel({
    this.id,
    required this.description,
    required this.value,
    required this.date,
    required this.category,
    required this.wayToreceive,
    required this.type,
  });

  factory FinancesModel.fromMap(Map<String, dynamic> map) {
    return FinancesModel(
      id: BigInt.from(map['id']),
      description: map['description'],
      value: map['value'].toDouble(),
      date: map['date'],
      category: map['category'],
      wayToreceive: map['wayToreceive'],
      type: map['type'],
    );
  }

  // Método para converter um objeto FinancesModel para um mapa
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'value': value,
      'date': date,
      'category': category,
      'wayToreceive': wayToreceive,
      'type': type,
    };
  }

  // Método para converter uma lista de objetos FinancesModel para uma lista de mapas
  static List<FinancesModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => FinancesModel.fromMap(map)).toList();
  }
}
