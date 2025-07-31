class ForgettpasswordPationt {
  final String message;

  ForgettpasswordPationt({required this.message});

  factory ForgettpasswordPationt.fromJson(dynamic json) {
    return ForgettpasswordPationt(
      message: json.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}

