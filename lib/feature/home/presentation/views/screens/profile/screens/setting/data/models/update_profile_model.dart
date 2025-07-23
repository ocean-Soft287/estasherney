class UpdateProfileModel {
  final String message;

  UpdateProfileModel({required this.message});

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      message: json['message'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
