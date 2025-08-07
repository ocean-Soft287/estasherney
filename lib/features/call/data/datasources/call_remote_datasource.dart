import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/features/call/data/models/call_model.dart';
import 'package:consult_me/features/call/data/models/my_call_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class CallRemoteDataSource {
  Future<Either<String,CallModel>> startCall({required  String targetUserId, required String durationInMinutes});
  Future<Either<String,String>> endCall({required  String id});
  Future<Either<String,List<MyCallModel>>> getmyCalls({required  String targetUserId, required String durationInMinutes});

}
class CallRemoteDataSourceImpl implements CallRemoteDataSource {
  DioConsumer dioConsumer;
  CallRemoteDataSourceImpl({required  this.dioConsumer});
  @override
  Future<Either<String, CallModel>> startCall({required String targetUserId, required String durationInMinutes})async {
   try{
       final res =   await dioConsumer.post(
            EndPoint.startCall,) ;
   final call = CallModel.fromJson(res);
   return Right(call);

   }on DioException catch(e){
     return Left(e.message??"");
   }catch(error){
     return Left(error.toString());
   }
  
  
  
  }
  
  @override
  Future<Either<String, String>> endCall({required String id}) async{
  try{
       final res =   await dioConsumer.post(
            EndPoint.startCall,) ;

   return Right(res);

   }on DioException catch(e){
     return Left(e.message??"");
   }catch(error){
     return Left(error.toString());
   }
  
  
  }
  
  @override
  Future<Either<String, List<MyCallModel>>> getmyCalls({required String targetUserId, required String durationInMinutes})async {
   try{
       List<dynamic> res =   await dioConsumer.post(
            EndPoint.startCall,) ;
   final call = res.map((e) => MyCallModel.fromJson(e)).toList();
   return Right(call);

   }on DioException catch(e){
     return Left(e.message??"");
   }catch(error){
     return Left(error.toString());
   }
  
  
  }


}