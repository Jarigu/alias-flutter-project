import 'package:alias_app/core/configs/app_configs.dart';
import 'package:alias_app/core/exceptions/http_exception.dart';
import 'package:alias_app/core/services/http/http_service.dart';
import 'package:dio/dio.dart';

/// Http service implementation with the Dio Package

class DioHttpService implements HttpService {
  DioHttpService({Dio? dioOverride}) {
    dio = dioOverride ?? Dio(baseOptions);
  }

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => AppConfigs.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  @override
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final Response response = await dio.get<Map<String, dynamic>>(
      endpoint,
      queryParameters: queryParameters,
    );

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data as Map<String, dynamic>;
  }

  @override
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  }) async {
    final Response response = await dio.post<Map<String, dynamic>>(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data as Map<String, dynamic>;
  }

  @override
  Future delete() {
    throw UnimplementedError();
  }

  @override
  Future put() {
    throw UnimplementedError();
  }
}
