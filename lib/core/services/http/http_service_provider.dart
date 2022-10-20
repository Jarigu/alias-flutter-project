import 'package:alias_app/core/services/http/dio_http_service.dart';
import 'package:alias_app/core/services/http/http_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider that maps an [HttpService] interface to implementation
final httpServiceProvider = Provider<HttpService>((ref) {
  return DioHttpService();
});
