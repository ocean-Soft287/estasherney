class GetProfileModel {
  final String fullName;
  final String phoneNumber;
  final String birthday;
  final String imageUrl;

  GetProfileModel({
    required this.fullName,
    required this.phoneNumber,
    required this.birthday,
    required this.imageUrl,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) {
    return GetProfileModel(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      birthday: json['birthday'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'birthday': birthday,
      'imageUrl': imageUrl,
    };
  }
}