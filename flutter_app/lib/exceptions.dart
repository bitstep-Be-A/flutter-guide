class NotFoundError implements Exception {
  String cause;
  NotFoundError({this.cause="Database cannot retrieve the data"});
}

class ValidationError implements Exception {
  String cause;
  ValidationError({this.cause="Validation error occurred"});
}
