
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
      'startDate': startDate != null
          ? startDate!.toIso8601String().split('T').first
          : null,
      'endDate': endDate != null
          ? endDate!.toIso8601String().split('T').first
          : null,
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


Future<void> sendAvailability() async {


  final availability = WeeklyAvailability();
  final daily = DayAvailability(
    startTime: "22:00",
    endTime: "23:00",
    consultationDurationMinutes: 30,
    consultationPrice: 350,
  );

  availability.days['Sunday'] = daily;
  availability.days['Monday'] = daily;
  availability.days['Tuesday'] = daily;
  availability.days['Wednesday'] = daily;
  availability.days['Thursday'] = daily;
  availability.days['Friday'] = null;
  availability.days['Saturday'] = null;

 
  final schedule = Schedule(
    startDate: DateTime(2025, 7, 15),
    endDate: DateTime(2025, 7, 21),
    weeklyAvailability: availability,
    availableConsultationTypes: ["Call", "Chat", "Video"],
  );

  final body = {
    "availabilityDto": schedule.toJson(),
  };

 
}
