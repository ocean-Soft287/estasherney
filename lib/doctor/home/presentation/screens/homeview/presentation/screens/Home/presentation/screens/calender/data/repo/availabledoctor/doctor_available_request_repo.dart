import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/doctor_available_request.dart';
import 'package:dartz/dartz.dart';

abstract class AddAvailabilityRepo {
  Future<Either<Failure, DoctorAvailabilityResponse>> addAvailability(
    DoctorAvailabilityRequest request,
  );
}
class DoctorAvailabilityRequest {
  final String startDate;
  final String endDate;
  final Map<String, AvailabilitySlot?> weeklyAvailability;
  final List<String> availableConsultationTypes;

  DoctorAvailabilityRequest({
    required this.startDate,
    required this.endDate,
    required this.weeklyAvailability,
    required this.availableConsultationTypes,
  });

  Map<String, dynamic> toJson() {
    return {
      "startDate": startDate,
      "endDate": endDate,
      "weeklyAvailability": weeklyAvailability.map(
        (day, slot) => MapEntry(
          day,
          slot != null ? slot.toJson() : null,
        ),
      ),
      "availableConsultationTypes": availableConsultationTypes,
    };
  }
}

class AvailabilitySlot {
  final String startTime;
  final String endTime;
  final int consultationDurationMinutes;
  final int consultationPrice;

  AvailabilitySlot({
    required this.startTime,
    required this.endTime,
    required this.consultationDurationMinutes,
    required this.consultationPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      "startTime": startTime,
      "endTime": endTime,
      "consultationDurationMinutes": consultationDurationMinutes,
      "consultationPrice": consultationPrice,
    };
  }
}

