abstract class Failure {
  final String message;
  final int statusCode;

  Failure(this.message, this.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure([String message = 'Server Error', int statusCode = 500])
      : super(message, statusCode);
}

class CacheFailure extends Failure {
  CacheFailure([String message = 'Cache Error', int statusCode = 500])
      : super(message, statusCode);
}
