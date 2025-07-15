class DoctorAvailabilityResponse {
  final String message;
  final int doctorId;

  DoctorAvailabilityResponse({
    required this.message,
    required this.doctorId,
  });

  factory DoctorAvailabilityResponse.fromJson(Map<String, dynamic> json) {
    return DoctorAvailabilityResponse(
      message: json['message'] ?? '',
      doctorId: json['doctorId'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'doctorId': doctorId,
    };
  }
}
