class DeleteAccountModel {
  final String message;

  DeleteAccountModel({required this.message});

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountModel(
      message: json['message'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
