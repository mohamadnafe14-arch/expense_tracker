abstract class Failure {
  final String message;

  Failure(this.message);
}

class GenericFailure extends Failure {
  GenericFailure(super.message);
}
