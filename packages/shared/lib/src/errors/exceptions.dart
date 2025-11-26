/// Thrown when there is an error during cache operations.
class CacheException implements Exception {
  const CacheException([this.message]);

  final String? message;

  @override
  String toString() {
    return message != null ? 'CacheException: $message' : 'CacheException';
  }
}
