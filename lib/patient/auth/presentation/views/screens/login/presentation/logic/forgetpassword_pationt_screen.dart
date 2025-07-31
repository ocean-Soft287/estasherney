abstract class ForgetpasswordPationtScreenState {}

class ForgetPasswordPationtInitial extends ForgetpasswordPationtScreenState {}

class ForgetPasswordPationtLoading extends ForgetpasswordPationtScreenState {}

class ForgetPasswordPationtSuccess extends ForgetpasswordPationtScreenState {
  final String message;

  ForgetPasswordPationtSuccess({required this.message});
}

class ForgetPasswordPationtFailure extends ForgetpasswordPationtScreenState {
  final String error;

  ForgetPasswordPationtFailure({required this.error});
}
 