sealed class Failures {
  final String message;

  const Failures(this.message);
}

final class ServerFailure extends Failures {
  const ServerFailure(super.message);
}
