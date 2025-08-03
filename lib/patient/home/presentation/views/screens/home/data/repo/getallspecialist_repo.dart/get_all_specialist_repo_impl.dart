import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_allspecialist.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/repo/getallspecialist_repo.dart/get_all_specialist_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllSpecialistRepoImpl implements GetAllSpecialistRepo {
  final DioConsumer dioConsumer;

  GetAllSpecialistRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, List<GetAllspecialistModel>>>
  getAllSpecialists() async {
    try {
      final response = await dioConsumer.get(EndPoint.getAllSpecialistspationt);

      final data = response as List;
      final specialists =
          data.map((e) => GetAllspecialistModel.fromJson(e)).toList();

      return Right(specialists);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
