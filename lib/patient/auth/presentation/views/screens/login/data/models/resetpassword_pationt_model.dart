class ResetpasswordPationtModel {
  final String message;

  ResetpasswordPationtModel({required this.message});

  factory ResetpasswordPationtModel.fromJson(Map<String, dynamic> json) {
    return ResetpasswordPationtModel(message: json['message'] ?? '');
  }

  Map<String, dynamic> toJson() => {"message": message};
}
