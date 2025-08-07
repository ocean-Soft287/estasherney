import 'package:consult_me/features/call/data/models/call_model.dart';

abstract class CallState {}

class CallInitial extends CallState {}

class CallLoading extends CallState {}

class StartCallLoading extends CallState {}
class EndCallLoading extends CallState {}
class GetAllMyCallsLoading extends CallState {}


class StartCallSuccess extends CallState {
  CallModel callModel;
  StartCallSuccess(this.callModel);
}
class EndCallSuccess extends CallState {}
class GetAllMyCallsSuccess extends CallState {}


class CallSuccess extends CallState {
  // final result;
  // Success(this.result);
}

class CallFailure extends CallState {
  final String error;
  CallFailure(this.error);
}
