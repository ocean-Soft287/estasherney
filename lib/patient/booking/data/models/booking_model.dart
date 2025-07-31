


class DoctorAvailabilityModel {
  int? id;
  String? date;
  List<String>? availableSessionTypes;
  double? consultationPrice;
  List<DayDetails>? dayDetails;

  DoctorAvailabilityModel({
    this.id,
    this.date,
    this.availableSessionTypes,
    this.consultationPrice,
    this.dayDetails,
  });

  factory DoctorAvailabilityModel.fromJson(Map<String, dynamic> json) {
    return DoctorAvailabilityModel(
      id: _parseInt(json['id']),
      date: json['date'],
      availableSessionTypes: json['availableSessionTypes'] != null
          ? List<String>.from(json['availableSessionTypes'])
          : null,
      consultationPrice: (json['consultationPrice'] as num?)?.toDouble(),
      dayDetails: json['dayDetails'] != null
          ? List<DayDetails>.from(
              json['dayDetails'].map((x) => DayDetails.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'availableSessionTypes': availableSessionTypes,
      'consultationPrice': consultationPrice,
      'dayDetails': dayDetails?.map((x) => x.toJson()).toList(),
    };
  }
}

// Model for day details
class DayDetails {
  String? day;
  String? startTime;
  String? endTime;
  int? consultationDurationMinutes;
  List<AvailableSlot>? availableSlots;

  DayDetails({
    this.day,
    this.startTime,
    this.endTime,
    this.consultationDurationMinutes,
    this.availableSlots,
  });

  factory DayDetails.fromJson(Map<String, dynamic> json) {
    return DayDetails(
      day: json['day'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      consultationDurationMinutes: _parseInt(json['consultationDurationMinutes']),
      availableSlots: json['availableSlots'] != null
          ? List<AvailableSlot>.from(
              json['availableSlots'].map((x) => AvailableSlot.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
      'consultationDurationMinutes': consultationDurationMinutes,
      'availableSlots': availableSlots?.map((x) => x.toJson()).toList(),
    };
  }
}

// Model for available slots
class AvailableSlot {
  String? startTime;
  String? endTime;
  bool? isSelected;
  String? date;
  String? sessionType;

  AvailableSlot({
    this.startTime,
    this.endTime,
    this.isSelected,
    this.date,
    this.sessionType,
  });

  factory AvailableSlot.fromJson(Map<String, dynamic> json) {
    return AvailableSlot(
      startTime: json['startTime'],
      endTime: json['endTime'],
      isSelected: json['isSelected'],
      date: json['date'],
      sessionType: json['sessionType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'isSelected': isSelected,
      'date': date,
      'sessionType': sessionType,
    };
  }
}

// Helper function to parse int from dynamic value
int? _parseInt(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}