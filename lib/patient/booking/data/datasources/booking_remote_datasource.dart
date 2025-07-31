import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/patient/booking/data/models/appointment_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_model.dart';
import 'package:consult_me/patient/booking/data/models/booking_response.dart';
import 'package:consult_me/patient/booking/data/models/confrim_payment.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BookingRemoteDataSource {

Future<Either<String, List<DoctorAvailabilityModel>>> getBookings({required String doctorId,required String date });
Future<Either<String, BookingResponse>> addAppointment({required  Appointment appointment });
Future<Either<String, String>> confirmPayment({required  ConfrimPayment appointment });


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

  @override
  Future<Either<String, BookingResponse>> addAppointment({required Appointment appointment})async {
  
  try {
    final response = await dioConsumer.post(
      EndPoint.addAppointment,
      isFromData: true,
      data: appointment.toJson(),
    );
    final model = BookingResponse.fromJson(response);
    return Right(model);
  } on DioException catch (e) {
    return Left(e.toString());
  } catch (e) {
    return Left(e.toString());
  
  }
  
  
  }
  
  @override
  Future<Either<String, String>> confirmPayment({required ConfrimPayment appointment}) async{
  
  try {
    final response = await dioConsumer.post(
      EndPoint.confirmAppointment,
      isFromData: true,
      data: appointment.toJson(),
    );
    return Right('تمت العملية بنجاح');
  } on DioException catch (e) {
    return Left(e.toString());
  } catch (e) {
    return Left(e.toString());
  
  }
  }



}