abstract class Failure {
  const Failure(this.message);
  final String message;
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
