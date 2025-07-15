class SearchAppointmentModel {
  final String message;
  final List<PastAppointmentData> data;

  SearchAppointmentModel({
    required this.message,
    required this.data,
  });

  factory SearchAppointmentModel.fromJson(Map<String, dynamic> json) {
    return SearchAppointmentModel(
      message: json['message'],
      data: List<PastAppointmentData>.from(
        json['data'].map((x) => PastAppointmentData.fromJson(x)),
      ),
    );
  }
}

class PastAppointmentData {
  final int id;
  final int doctorId;
  final String fullName;
  final String date;
  final String slotStartTime;
  final String slotEndTime;
  final String sessionType;
  final double consultationPrice;

  final int? patientId;
  final String? documentPath;
  final String? status;
  final String? whoIsPatient;
  final int? age;
  final String? gender;
  final String? problemDescription;

  PastAppointmentData({
    required this.id,
    required this.doctorId,
    required this.fullName,
    required this.date,
    required this.slotStartTime,
    required this.slotEndTime,
    required this.sessionType,
    required this.consultationPrice,
    this.patientId,
    this.documentPath,
    this.status,
    this.whoIsPatient,
    this.age,
    this.gender,
    this.problemDescription,
  });

  factory PastAppointmentData.fromJson(Map<String, dynamic> json) {
    return PastAppointmentData(
      id: json['id'],
      doctorId: json['doctorId'],
      fullName: json['fullName'],
      date: json['date'],
      slotStartTime: json['slotStartTime'],
      slotEndTime: json['slotEndTime'],
      sessionType: json['sessionType'],
      consultationPrice: (json['consultationPrice'] as num).toDouble(),
      patientId: json['patientId'],
      documentPath: json['documentPath'],
      status: json['status'],
      whoIsPatient: json['whoIsPatient'],
      age: json['age'],
      gender: json['gender'],
      problemDescription: json['problemDescription'],
    );
  }
}
