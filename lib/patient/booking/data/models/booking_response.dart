class BookingResponse {
  final String message;
  final int appointmentId;
  final double finalConsultationPrice;

  BookingResponse({
    required this.message,
    required this.appointmentId,
    required this.finalConsultationPrice,
  });

  factory BookingResponse.fromJson(Map<String, dynamic> json) {
    return BookingResponse(
      message: json['message'],
      appointmentId: json['appointmentId'],
      finalConsultationPrice: json['finalConsultationPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'appointmentId': appointmentId,
      'finalConsultationPrice': finalConsultationPrice,
    };
  }
}
