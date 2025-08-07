import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/features/call/data/models/call_model.dart';
import 'package:consult_me/features/call/data/models/my_call_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CallRemoteDataSource {
  Future<Either<String,CallModel>> startCall({required  int targetUserId, required int durationInMinutes});
  Future<Either<String,String>> endCall({required  int id});
  Future<Either<String,List<MyCallModel>>> getmyCalls();
  Future<Either<String,String>> getPatientDeviceToken({required  int id});
  Future<Either<String,String>> updateDeviceToken({required  int patientId,required String deviceToken});

  //getPatientDeviceToken

//updateDeviceToken
}
class CallRemoteDataSourceImpl implements CallRemoteDataSource {
  DioConsumer dioConsumer;
  CallRemoteDataSourceImpl({required  this.dioConsumer});
  @override
  Future<Either<String, CallModel>> startCall({required int targetUserId, required int durationInMinutes})async {
   try{
       final res =   await dioConsumer.post(
            EndPoint.startCall,data: {
         "targetUserId": targetUserId,
         "durationInMinutes": durationInMinutes
       }) ;
   final call = CallModel.fromJson(res);
   return Right(call);

   }on DioException catch(e){
     return Left(e.message??"");
   }catch(error){
     return Left(error.toString());
   }
  
  
  
  }
  
  @override
  Future<Either<String, String>> endCall({required int id}) async{
  try{
       final res =   await dioConsumer.post(
            EndPoint.endCall(id: id),) ;

   return Right(res);

   }on DioException catch(e){
     return Left(e.message??"");
   }catch(error){
     return Left(error.toString());
   }
  
  
  }
  
  @override
  Future<Either<String, List<MyCallModel>>> getmyCalls()async {
   try{
       List<dynamic> res =   await dioConsumer.get(
            EndPoint.getmyCalls,) ;
   final call = res.map((e) => MyCallModel.fromJson(e)).toList();
   return Right(call);

   }on DioException catch(e){
     return Left(e.message??"");
   }catch(error){
     return Left(error.toString());
   }
  
  
  }

  @override
  Future<Either<String, String>> getPatientDeviceToken({required int id}) async{
    try{
      final res =   await dioConsumer.get(
        EndPoint.getPatientDeviceToken(id: id),) ;
      return Right(res['deviceToken']);

    }on DioException catch(e){
      return Left(e.message??"");
    }catch(error){
      return Left(error.toString());
    }


  }

  @override
  Future<Either<String, String>> updateDeviceToken({required int patientId, required String deviceToken})async {
    try{
      final res =   await dioConsumer.put(
        EndPoint.getmyCalls,  data: EndPoint.updatePatientDeviceTokenbody(patientId: patientId, deviceToken: deviceToken)) ;
      return Right(res['message']);

    }on DioException catch(e){
      return Left(e.message??"");
    }catch(error){
      return Left(error.toString());
    }


  }


}