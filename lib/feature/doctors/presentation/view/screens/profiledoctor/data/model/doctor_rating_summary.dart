class DoctorSummaryModel {
  final int doctorId;
  final double averageRating;
  final int totalRatings;

  DoctorSummaryModel({
    required this.doctorId,
    required this.averageRating,
    required this.totalRatings,
  });

  factory DoctorSummaryModel.fromJson(Map<String, dynamic> json) {
    return DoctorSummaryModel(
      doctorId: json['doctorId'] as int,
      averageRating: (json['averageRating'] as num).toDouble(), // ← مهم جداً
      totalRatings: json['totalRatings'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'averageRating': averageRating,
      'totalRatings': totalRatings,
    };
  }
}
