class ApiException implements Exception {
  final String message;
  ApiException({required this.message});
}

class NoInternetException implements Exception {}

class UnauthorizedUser implements Exception {}
