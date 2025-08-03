class DoctorAllModel {
  final double averageRating;
  final List<DoctorModel> ratings;

  DoctorAllModel({
    required this.averageRating,
    required this.ratings,
  });

 factory DoctorAllModel.fromJson(Map<String, dynamic> json) {
  final data = json['data'] ?? {};
  final ratingsList = data['ratings'];
  return DoctorAllModel(
    averageRating: (data['averageRating'] ?? 0).toDouble(),
    ratings: ratingsList != null
        ? (ratingsList as List<dynamic>)
            .map((e) => DoctorModel.fromJson(e))
            .toList()
        : [],
  );
}

}

class DoctorModel {
  final int id;
  final String patientName;
  final int rating;
  final String comment;
  final String ratedAt;

  DoctorModel({
    required this.id,
    required this.patientName,
    required this.rating,
    required this.comment,
    required this.ratedAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 0,
      patientName: json['patientName'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      ratedAt: json['ratedAt'] ?? '',
    );
  }
}
