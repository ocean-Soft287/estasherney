class Appointment {
  final String slotStartTime;
  final String slotEndTime;
  final String whoIsPatient;
  final String fullName;
  final int age;
  final String gender;
  final String problemDescription;
  final DateTime date;
  final String sessionType;
  final String fileName; // Assuming the file is stored as a name or URL

  Appointment({
    required this.slotStartTime,
    required this.slotEndTime,
    required this.whoIsPatient,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.problemDescription,
    required this.date,
    required this.sessionType,
    required this.fileName,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      slotStartTime: json['SlotStartTime'],
      slotEndTime: json['SlotEndTime'],
      whoIsPatient: json['WhoIsPatient'],
      fullName: json['FullName'],
      age: int.parse(json['Age'].toString()),
      gender: json['Gender'],
      problemDescription: json['ProblemDescription'],
      date: DateTime.parse(json['Date']),
      sessionType: json['SessionType'],
      fileName: json['File'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'SlotStartTime': slotStartTime,
      'SlotEndTime': slotEndTime,
      'WhoIsPatient': whoIsPatient,
      'FullName': fullName,
      'Age': age,
      'Gender': gender,
      'ProblemDescription': problemDescription,
      'Date': date.toIso8601String(),
      'SessionType': sessionType,
      'File': fileName,
    };
  }
}
