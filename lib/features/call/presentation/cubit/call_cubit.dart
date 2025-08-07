import 'package:consult_me/features/call/data/datasources/call_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  CallRemoteDataSource callRemoteDataSourc;
  CallCubit({required this.callRemoteDataSourc}) : super(CallInitial());

  Future<void> startCall({required String targetUserId, required String durationInMinutes}) async {
    emit(StartCallLoading());
    try {
  final res =   await callRemoteDataSourc.startCall(targetUserId: targetUserId, durationInMinutes: durationInMinutes);
    res.fold((e){
      emit(CallFailure(e.toString()));

    }, (ifRight){
            emit(StartCallSuccess( ifRight));

    });
     } catch (e) {
      emit(CallFailure(e.toString()));
    }
  }


 Future<void> endCall() async {
    emit(CallLoading());
    try {
      // Call usecase
      // emit(CallSuccess(result));
    } catch (e) {
      emit(CallFailure(e.toString()));
    }
  } Future<void> getAllCalls() async {
    emit(CallLoading());
    try {
      // Call usecase
      // emit(CallSuccess(result));
  
    } catch (e) {
      emit(CallFailure(e.toString()));
    }
  }

}
