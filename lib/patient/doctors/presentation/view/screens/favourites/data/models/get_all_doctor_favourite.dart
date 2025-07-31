class GetAllDoctorFavourite {
  final int doctorId;
  final String doctorName;
  final String image;
  final String specialization;

  GetAllDoctorFavourite({
    required this.doctorId,
    required this.doctorName,
    required this.image,
    required this.specialization,
  });

  factory GetAllDoctorFavourite.fromJson(Map<String, dynamic> json) {
    return GetAllDoctorFavourite(
      doctorId: json['doctorId'] ?? 0,
      doctorName: json['doctorName'] ?? '',
      image: json['image'] ?? '',
      specialization: json['specialization'] ?? '',
    );
  }
}
