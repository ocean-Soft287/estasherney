import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/features/call/data/datasources/call_remote_datasource.dart';
import 'package:consult_me/features/call/presentation/pages/video.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/notifications/notification_push.dart';
import 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  CallRemoteDataSource callRemoteDataSourc;
  CallCubit({required this.callRemoteDataSourc}) : super(CallInitial());

  Future<void> startCall({required int targetUserId, required int durationInMinutes}) async {
    emit(StartCallLoading());
    try {
  final res =   await callRemoteDataSourc.startCall(targetUserId: targetUserId, durationInMinutes: durationInMinutes);
    res.fold((e){
      emit(CallFailure(e.toString()));

    }, (ifRight){

          getAllCalls();

    });
     } catch (e) {
      emit(CallFailure(e.toString()));
    }
 
  }


 Future<void> endCall({required int id}) async {
    emit(EndCallLoading());
    try {
   final res =  await callRemoteDataSourc.endCall(id: id);
   res.fold((e){
     emit(CallFailure(e.toString()));

   }, (ifRight){

     emit(EndCallSuccess());
   });
    } catch (e) {
      emit(CallFailure(e.toString()));
    }

  } Future<void> getAllCalls() async {
    emit(GetAllMyCallsLoading());
    try {
     final res = await callRemoteDataSourc.getmyCalls();
     res.fold((e){
       emit(CallFailure(e.toString()));

     }, (ifRight)async{
     final res = await  callRemoteDataSourc.getPatientDeviceToken(id: ifRight.last.patientId!);
    res.fold((e){
      emit(CallFailure(e.toString()));

    }, (deviceToken){
      NotificationService.sendNotification(deviceToken, 'title', 'body', ifRight.last);
      emit(GetAllMyCallsSuccess(calls:  ifRight ));
      NavigationService.push(Video(call:  ifRight.last));

    });

     });
    } catch (e) {
      emit(CallFailure(e.toString()));
    }
  }

}
