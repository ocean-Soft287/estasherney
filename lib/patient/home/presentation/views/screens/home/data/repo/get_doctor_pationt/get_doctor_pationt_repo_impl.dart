import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/repo/get_doctor_pationt/get_doctor_pationt_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class GetDoctorsBySpecialtyRepoImpl implements GetDoctorsBySpecialtyRepo {
  final DioConsumer dioConsumer;

  GetDoctorsBySpecialtyRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, List<DoctorModel>>> getDoctorsBySpecialty(
    String specialty,
  ) async {
    try {

      final response = await dioConsumer.get(
        EndPoint.getAllDoctorsBySpecialty,
        queryParameters: {'specialty': specialty},
      );


      final data = response['data'];
      if (data == null || data is! List || data.isEmpty) {
        return Left(ServerFailure("لا يوجد دكاترة لهذا التخصص"));
      }

      List<DoctorModel> doctors = data
          .cast<Map<String, dynamic>>()
          .map(DoctorModel.fromJson)
          .toList();

      return Right(doctors);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return Left(ServerFailure("لا يوجد دكاترة لهذا التخصص"));
      }
      return Left(ServerFailure(e.toString()));
    } catch (e) {
     
      return Left(ServerFailure(e.toString()));
    }
  }
}
