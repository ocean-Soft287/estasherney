import 'package:flutter_bloc/flutter_bloc.dart';
import 'call_state.dart';

class CallCubit extends Cubit<CallState> {
  CallCubit() : super(CallInitial());

  Future<void> doSomething() async {
    emit(CallLoading());
    try {
      // Call usecase
      // emit(CallSuccess(result));
    } catch (e) {
      emit(CallFailure(e.toString()));
    }
  }
}
