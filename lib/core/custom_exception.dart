class CustomException implements Exception {
  final String? _prefix;

  CustomException([this._prefix]);

  @override
  String toString() {
    return _prefix.toString();
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message ?? "internetError: FetchData");
}

class BadRequestException extends CustomException {
  BadRequestException([String? message]) : super(message ?? "internetError: BadRequest");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([String? message]) : super(message ?? "internetError: Unauthorised");
}
