class AppointmentsResponse {
  final String message;
  final List<AppointmentModel> data;

  AppointmentsResponse({
    required this.message,
    required this.data,
  });

  factory AppointmentsResponse.fromJson(Map<String, dynamic> json) {
    return AppointmentsResponse(
      message: json['message'],
      data: List<AppointmentModel>.from(
        json['data'].map((item) => AppointmentModel.fromJson(item)),
      ),
    );
  }
}

class AppointmentModel {
  final int id;
  final String doctorName;
  final String doctorImage;
  final String fullName;
  final int age;
  final String gender;
  final String problemDescription;
  final String date;
  final String slotStartTime;
  final String slotEndTime;
  final bool isSelected;
  final String status;

  AppointmentModel({
    required this.id,
    required this.doctorName,
    required this.doctorImage,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.problemDescription,
    required this.date,
    required this.slotStartTime,
    required this.slotEndTime,
    required this.isSelected,
    required this.status,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'],
      doctorName: json['doctorName'],
      doctorImage: json['doctorImage'],
      fullName: json['fullName'],
      age: json['age'],
      gender: json['gender'],
      problemDescription: json['problemDescription'],
      date: json['date'],
      slotStartTime: json['slotStartTime'],
      slotEndTime: json['slotEndTime'],
      isSelected: json['isSelected'],
      status: json['status'],
    );
  }
}
