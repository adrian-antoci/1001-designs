sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

final class AppUnexpectedException extends AppException {
  const AppUnexpectedException(super.message, this.stackTrace);
  final StackTrace stackTrace;
}

final class AppAPIException extends AppException {
  const AppAPIException(super.message, this.statusCode);
  final int statusCode;
}
