class AppointmentModel {
  final String? name;
  final String? status;

  AppointmentModel({this.name, this.status});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      name: json['name'],
      status: json['status'],
    );
  }
}
