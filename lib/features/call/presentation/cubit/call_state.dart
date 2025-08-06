abstract class CallState {}

class CallInitial extends CallState {}

class CallLoading extends CallState {}

class CallSuccess extends CallState {
  // final result;
  // Success(this.result);
}

class CallFailure extends CallState {
  final String error;
  CallFailure(this.error);
}
