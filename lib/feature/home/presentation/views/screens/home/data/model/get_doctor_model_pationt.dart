class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String doctorImage;
  final String doctorCertificate;
  final String phone;
  final String nationalID;
  final String specialization;
  final double examPrice;
  final int doctorPercentage;
  final int yearsOfExperience;
  final String profileInfo;
  final String gender;
   bool isFavorite;

  DoctorModel({
     this.isFavorite = false,
    required this.id,
    required this.name,
    required this.email,
    required this.doctorImage,
    required this.doctorCertificate,
    required this.phone,
    required this.nationalID,
    required this.specialization,
    required this.examPrice,
    required this.doctorPercentage,
    required this.yearsOfExperience,
    required this.profileInfo,
    required this.gender,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      doctorImage: json['doctorImage'],
      doctorCertificate: json['doctorCertificate'],
      phone: json['phone'],
      nationalID: json['nationalID'],
      specialization: json['specialization'],
      examPrice: (json['examenPrice'] ?? 0).toDouble(),
      doctorPercentage: json['doctorPersentage'],
      yearsOfExperience: json['yearsOfExperience'],
      profileInfo: json['profileInfo'],
      gender: json['gender'],
       isFavorite: json['isFavorite'] ?? false,
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
      'examenPrice': examPrice,
      'doctorPersentage': doctorPercentage,
      'yearsOfExperience': yearsOfExperience,
      'profileInfo': profileInfo,
      'gender': gender,
      'isFavorite': isFavorite,
    };
  }
}
