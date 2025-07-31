abstract class ResetpasswordPationtState {} 
class ResetpasswordPationtInitial extends ResetpasswordPationtState {}
class ResetpasswordPationtLoading extends ResetpasswordPationtState {}

class ResetpasswordPationtSuccess extends ResetpasswordPationtState {
  final String message;

  ResetpasswordPationtSuccess({required this.message});
}

class ResetpasswordPationtFailure extends ResetpasswordPationtState {
  final String error;

  ResetpasswordPationtFailure({required this.error});
}
