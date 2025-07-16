class Schedule {
  final DateTime? startDate;
  final DateTime? endDate;
  final WeeklyAvailability weeklyAvailability;
  final List<String>? availableConsultationTypes;

  Schedule({
    this.startDate,
    this.endDate,
    required this.weeklyAvailability,
    this.availableConsultationTypes,
  });

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'weeklyAvailability': weeklyAvailability.toJson(),
      'availableConsultationTypes': availableConsultationTypes ?? [],
    };
  }
}

class WeeklyAvailability {
  Map<String, DayAvailability?> days = {};

  WeeklyAvailability() {
    days = {
      'Sunday': null,
      'Monday': null,
      'Tuesday': null,
      'Wednesday': null,
      'Thursday': null,
      'Friday': null,
      'Saturday': null,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};

    days.forEach((key, value) {
      json[key] = value?.toJson();
    });

    return json;
  }
}

class DayAvailability {
  final String startTime;
  final String endTime;
  final int consultationDurationMinutes;
  final double consultationPrice;

  DayAvailability({
    required this.startTime,
    required this.endTime,
    required this.consultationDurationMinutes,
    required this.consultationPrice,
  });

  factory DayAvailability.fromJson(Map<String, dynamic> json) {
    return DayAvailability(
      startTime: json['startTime'],
      endTime: json['endTime'],
      consultationDurationMinutes: json['consultationDurationMinutes'],
      consultationPrice: json['consultationPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'consultationDurationMinutes': consultationDurationMinutes,
      'consultationPrice': consultationPrice,
    };
  }
}
