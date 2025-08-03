class GetAllspecialistModel {
  final int id;
  final String name;
  GetAllspecialistModel({
    required this.id,
    required this.name,
  });
  factory GetAllspecialistModel.fromJson(Map<String, dynamic> json) {
    return GetAllspecialistModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
