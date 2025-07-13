class DoctorFutureAppointmentmodel {
  final String? name;
  final String? status;

  DoctorFutureAppointmentmodel({this.name, this.status});

  factory DoctorFutureAppointmentmodel.fromJson(Map<String, dynamic> json) {
    return DoctorFutureAppointmentmodel(name: json['name'], status: json['status']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'status': status};
  }
}
