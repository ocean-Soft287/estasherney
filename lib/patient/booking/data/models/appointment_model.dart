import 'dart:io';

class Appointment {
  final String slotStartTime;
  final String slotEndTime;
  final String whoIsPatient;
  final String fullName;
  final int age;
  final String gender;
  final String problemDescription;
  final String date;
  final String sessionType;
  final String doctorId;
  final List<File> files; // Multiple file support

  Appointment( {
    required this.doctorId,
    required this.slotStartTime,
    required this.slotEndTime,
    required this.whoIsPatient,
    required this.fullName,
    required this.age,
    required this.gender,
    required this.problemDescription,
    required this.date,
    required this.sessionType,
    required this.files,
  });

  

  Map<String, dynamic> _baseJson() {
    return {
      'DoctorId':doctorId,
      'SlotStartTime': slotStartTime,
      'SlotEndTime': slotEndTime,
      'WhoIsPatient': whoIsPatient,
      'FullName': fullName,
      'Age': age,
      'Gender': gender,
      'ProblemDescription': problemDescription,
      'Date': date,
      'SessionType': sessionType,
    };
  }

Map<String, dynamic> toJson()  {
  final base = _baseJson();

  if (files.isNotEmpty) {
    final fileMetadata = files.map((file) => {
      'filename': file.path.split('/').last,
      'path': file.path,
    }).toList();

    return {
      ...base,
      'Files': fileMetadata, 
    };
  }

  return base;
}
}
