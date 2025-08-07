class AppointmentsPationtResponse {
  final String message;
  final List<AppointmentModel> data;

  AppointmentsPationtResponse({
    required this.message,
    required this.data,
  });

  factory AppointmentsPationtResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentsPationtResponse(
      message: json['message'] ?? '',
      data: List<AppointmentModel>.from(
        (json['data'] ?? []).map((item) => AppointmentModel.fromJson(item)),
      ),
    );
  }
}

class AppointmentModel {
  final int id;
  final int doctorId;
  final String doctorName;
  final String doctorSpecialization;
  final String doctorImage;
  final int patientId;
  final String fullName;
  final int? age;
  final String gender;
  final String problemDescription;
  final String date;
  final String slotStartTime;
  final String slotEndTime;
  final bool isSelected;
  final String sessionType;
  final String status;
  final String documentOrImage;

  AppointmentModel({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.doctorSpecialization,
    required this.doctorImage,
    required this.patientId,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.problemDescription,
    required this.date,
    required this.slotStartTime,
    required this.slotEndTime,
    required this.isSelected,
    required this.sessionType,
    required this.status,
    required this.documentOrImage,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] ?? 0,
      doctorId: json['doctorId'] ?? 0,
      doctorName: json['doctorName'] ?? '',
      doctorSpecialization: json['doctorSpecialization'] ?? '',
      doctorImage: json['doctorImage'] ?? '',
      patientId: json['patientId'] ?? 0,
      fullName: json['fullName'] ?? '',
      age: json['age'] is int ? json['age'] : int.tryParse(json['age'].toString()),
      gender: json['gender'] ?? '',
      problemDescription: json['problemDescription'] ?? '',
      date: json['date'] ?? '',
      slotStartTime: json['slotStartTime'] ?? '',
      slotEndTime: json['slotEndTime'] ?? '',
      isSelected: json['isSelected'] ?? false,
      sessionType: json['sessionType'] ?? '',
      status: json['status'] ?? '',
      documentOrImage: json['documentOrImage'] ?? '',
    );
  }
}
