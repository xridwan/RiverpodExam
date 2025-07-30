class Character {
  final int id;
  final String name;
  final String status;

  Character({required this.id, required this.name, required this.status});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'status': status};
  }
}
