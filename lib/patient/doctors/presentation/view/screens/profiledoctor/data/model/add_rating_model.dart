class AddRatingModel {
  final String message;

  AddRatingModel({required this.message});

  factory AddRatingModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return AddRatingModel(
        message: json['message'] ?? 'تم التقييم بنجاح',
      );
    } else if (json is String) {
      return AddRatingModel(message: json); 
    } else {
      throw Exception('Invalid response type: $json');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }
}
