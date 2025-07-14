class PastAppointmentModel {
  final String message;
  final List<PastAppointmentData> data;

  PastAppointmentModel({
    required this.message,
    required this.data,
  });

  factory PastAppointmentModel.fromJson(Map<String, dynamic> json) {
    return PastAppointmentModel(
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
  final int patientId;
  final String fullName;
  final String date;
  final String slotStartTime;
  final String slotEndTime;
  final String sessionType;
  final String documentPath;
  final String status;
  final String whoIsPatient;
  final int age;
  final String gender;
  final String problemDescription;

  PastAppointmentData({
    required this.id,
    required this.doctorId,
    required this.patientId,
    required this.fullName,
    required this.date,
    required this.slotStartTime,
    required this.slotEndTime,
    required this.sessionType,
    required this.documentPath,
    required this.status,
    required this.whoIsPatient,
    required this.age,
    required this.gender,
    required this.problemDescription,
  });

  factory PastAppointmentData.fromJson(Map<String, dynamic> json) {
    return PastAppointmentData(
      id: json['id'],
      doctorId: json['doctorId'],
      patientId: json['patientId'],
      fullName: json['fullName'],
      date: json['date'],
      slotStartTime: json['slotStartTime'],
      slotEndTime: json['slotEndTime'],
      sessionType: json['sessionType'],
      documentPath: json['documentPath'],
      status: json['status'],
      whoIsPatient: json['whoIsPatient'],
      age: json['age'],
      gender: json['gender'],
      problemDescription: json['problemDescription'],
    );
  }
}
