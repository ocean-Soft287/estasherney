class LoginModel {
   final int id;
  final String name;
  final String email;
  final String doctorImage;
  final String doctorCertificate;
  final String phone;
  final String nationalID;
  final String specialization;
  final int examenPrice;
  final int doctorPersentage;
  final int yearsOfExperience;
  final String? profileInfo;
  final String? gender;
  final String token;

  LoginModel({
    required this.id,
    required this.name,
    required this.email,
    required this.doctorImage,
    required this.doctorCertificate,
    required this.phone,
    required this.nationalID,
    required this.specialization,
    required this.examenPrice,
    required this.doctorPersentage,
    required this.yearsOfExperience,
    this.profileInfo,
    this.gender,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      doctorImage: json['doctorImage'] ?? '',
      doctorCertificate: json['doctorCertificate'] ?? '',
      phone: json['phone'] ?? '',
      nationalID: json['nationalID'] ?? '',
      specialization: json['specialization'] ?? '',
      examenPrice: json['examenPrice'] ?? 0,
      doctorPersentage: json['doctorPersentage'] ?? 0,
      yearsOfExperience: json['yearsOfExperience'] ?? 0,
      profileInfo: json['profileInfo'],
      gender: json['gender'],
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'doctorImage': doctorImage,
      'doctorCertificate': doctorCertificate,
      'phone': phone,
      'nationalID': nationalID,
      'specialization': specialization,
      'examenPrice': examenPrice,
      'doctorPersentage': doctorPersentage,
      'yearsOfExperience': yearsOfExperience,
      'profileInfo': profileInfo,
      'gender': gender,
      'token': token,
    };
  }
}