class ResetPasswordModel {
  final String message;

  ResetPasswordModel({required this.message});

  factory ResetPasswordModel.fromJson(dynamic json) {
    return ResetPasswordModel(message: json.toString());
  }

  Map<String, dynamic> toJson() => {"message": message};
}
