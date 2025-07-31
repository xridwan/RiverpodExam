class CharacterModel {
  final int id;
  final String name;
  final String status;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'status': status, 'image': image};
  }
}
