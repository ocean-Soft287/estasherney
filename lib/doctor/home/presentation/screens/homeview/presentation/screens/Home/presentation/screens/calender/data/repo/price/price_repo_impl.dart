import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/price_model.dart';
import 'price_repo.dart';

class PriceRepoImpl implements PriceRepo {
  final DioConsumer dioConsumer;

  PriceRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, PriceModel>> fetchPrice(double price) async {
    try {
      final response = await dioConsumer.get(
        EndPoint.doctorprice,
        queryParameters: {'price': price},
      );

      return Right(PriceModel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'خطأ في السيرفر'));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع'));
    }
  }
}
