import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/feature/booking/data/models/booking_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BookingRemoteDataSource {

Future<Either<String, List<DoctorAvailabilityModel>>> getBookings({required String doctorId,required String date });
}
class BookingRemoteDataSourceImpl implements BookingRemoteDataSource {
   DioConsumer dioConsumer;
  BookingRemoteDataSourceImpl({required this.dioConsumer});
  @override
  Future<Either<String, List<DoctorAvailabilityModel>>> getBookings({required String doctorId,required String date }) async {
 try {
   final response = await dioConsumer.get(
     EndPoint.getDoctorAvailabilitiesByIdAndDay(doctorId: doctorId, date: date),
   );

   if (response == null) {
     return Left(('فشل تحميل بيانات التقييم'));
   }
      List<dynamic> doctorsJson = response['data'] ?? [];
   final List<DoctorAvailabilityModel> doctors = doctorsJson
       .map((json) => DoctorAvailabilityModel.fromJson(json))
       .toList();
   return Right(doctors);
 
 }on DioException  catch (e) {
   return Left(e.toString());
 }catch (e) {
   return Left(e.toString());
 }
}



}