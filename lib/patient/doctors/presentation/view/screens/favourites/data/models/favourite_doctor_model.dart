class FavoriteDoctorModel {
  final int doctorId;
  final String doctorName;

  FavoriteDoctorModel({required this.doctorId, required this.doctorName});

  factory FavoriteDoctorModel.fromJson(Map<String, dynamic> json) {
    return FavoriteDoctorModel(
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'doctorName': doctorName,
    };
  }
}
