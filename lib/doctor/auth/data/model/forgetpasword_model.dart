class ForgetPasswordModel {
  final String message;

  ForgetPasswordModel({required this.message});

  factory ForgetPasswordModel.fromJson(dynamic json) {
    return ForgetPasswordModel(
      message: json.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
