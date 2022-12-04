class ServerException implements Exception {
  final String message = "Server error";
}

class CacheException implements Exception {
  final String message = "Cache error";
}
