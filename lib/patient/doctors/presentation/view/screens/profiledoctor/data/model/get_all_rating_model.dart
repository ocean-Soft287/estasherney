class DoctorRatingModel {
  final double averageRating;
  final List<SingleRating> ratings;

  DoctorRatingModel({
    required this.averageRating,
    required this.ratings,
  });

  factory DoctorRatingModel.fromJson(Map<String, dynamic> json) {
    return DoctorRatingModel(
      averageRating: (json['averageRating'] ?? 0).toDouble(),
      ratings: (json['ratings'] as List)
          .map((item) => SingleRating.fromJson(item))
          .toList(),
    );
  }
}

class SingleRating {
  final int id;
  final String patientName;
  final int rating;
  final String comment;
  final String ratedAt;

  SingleRating({
    required this.id,
    required this.patientName,
    required this.rating,
    required this.comment,
    required this.ratedAt,
  });

  factory SingleRating.fromJson(Map<String, dynamic> json) {
    return SingleRating(
      id: json['id'] ?? 0,
      patientName: json['patientName'] ?? '',
      rating: json['rating'] ?? 0,
      comment: json['comment'] ?? '',
      ratedAt: json['ratedAt'] ?? '',
    );
  }
}
