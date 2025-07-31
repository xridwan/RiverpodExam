import 'package:dio/dio.dart';

import '../error/handle_dio_error.dart';

class DioClient {
  final Dio _dio;
  final String _baseUrl = 'https://rickandmortyapi.com/api';

  DioClient(this._dio);

  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/$endpoint',
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw handleDioError(e);
    }
  }
}
