class RemoveFavoriteDoctorModel {
  final String message;

  RemoveFavoriteDoctorModel({required this.message});

  factory RemoveFavoriteDoctorModel.fromJson(Map<String, dynamic> json) {
    return RemoveFavoriteDoctorModel(
      message: json['message'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
