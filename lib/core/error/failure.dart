sealed class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

final class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

final class CacheFailure extends Failure {
  CacheFailure({required super.errorMessage});
}
