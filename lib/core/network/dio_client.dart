import 'package:dio/dio.dart';

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
      throw Exception('Failed to load data: ${e.message}');
    }
  }
}
