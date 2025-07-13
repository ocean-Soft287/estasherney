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
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'status': status,
    };
  }
}
