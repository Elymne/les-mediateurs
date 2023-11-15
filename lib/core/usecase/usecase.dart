abstract class Usecase<T, P> {
  Future<T> perform(P params);
}

abstract class UsecaseNoParams<T> {
  Future<T> perform();
}
