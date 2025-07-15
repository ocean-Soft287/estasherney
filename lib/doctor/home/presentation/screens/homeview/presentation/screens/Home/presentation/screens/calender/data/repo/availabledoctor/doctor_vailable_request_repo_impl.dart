import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/doctor_available_request.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/repo/availabledoctor/doctor_available_request_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DoctorAvailbleRequestRepoImpl implements AddAvailabilityRepo{
  final DioConsumer dioConsumer;

  DoctorAvailbleRequestRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, DoctorAvailabilityResponse>> addAvailability(
    DoctorAvailabilityRequest request,
  ) async {
    try {
      final response = await dioConsumer.post(
        EndPoint.getDoctoravaibilty,
        data: request.toJson(),
      );

      if (response is Map<String, dynamic>) {
        final data = DoctorAvailabilityResponse.fromJson(response);
        return Right(data);
      } else {
        return Left(ServerFailure('Unexpected response format'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown error'));
    } catch (e) {
      return Left(ServerFailure('خطأ أثناء إضافة التوفر'));
    }
  }
}