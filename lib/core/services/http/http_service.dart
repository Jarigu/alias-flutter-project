abstract class HttpService {
  String get baseUrl;

  /// Http headers
  Map<String, String> get headers;

  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  });

  Future<dynamic> put();

  Future<dynamic> delete();
}
