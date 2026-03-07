class DragonballModel {
  final int id;
  final String name;
  final String ki;
  final String maxKi;
  final String race;
  final String gender;
  final String description;
  final String image;
  final String affilation;
  final DateTime deleteAt;

  DragonballModel({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affilation,
    required this.deleteAt
  });
  factory DragonballModel.fromJson(Map<String, dynamic> json) => 
      DragonballModel(id: json['id'] ?? 0, name: json['name'] ?? "not name", ki: json['ki'] ?? "not ki", maxKi: json['maxKi'] ?? "not maxKi", race: json['race'] ?? "not race", gender: json['gender'] ?? "not gender", description: json['description'] ?? "not description", image: json['image'] ?? "not image", affilation: json['affilation'] ?? "not affilation", deleteAt: DateTime.parse(json['deleteAt'] ?? DateTime.now().toString()));
}