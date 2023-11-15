abstract class Usecase<T, P extends Params> {
  Future<Result<T>> perform(P params);
}

abstract class UsecaseNoParams<T> {
  Future<Result<T>> perform();
}

abstract class Params {}

sealed class Result<T> {}

final class Success<T> extends Result<T> {
  final T value;

  Success({required this.value});
}

final class Failure<T> extends Result<T> {
  final Exception exception;

  Failure({required this.exception});
}
