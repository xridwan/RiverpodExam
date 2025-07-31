import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'exception.dart';

Exception handleDioError(DioException e) {
  final statusCode = e.response?.statusCode;
  // Cek dulu apakah data error berupa Map dan ada key 'error' atau 'message'
  String message = 'Unexpected error';

  if (e.response?.data is Map<String, dynamic>) {
    final data = e.response!.data as Map<String, dynamic>;
    if (data.containsKey('error')) {
      message = data['error'].toString();
    } else if (data.containsKey('message')) {
      message = data['message'].toString();
    }
  }

  // Optional: sesuaikan pesan berdasarkan status code
  switch (statusCode) {
    case 400:
      message = 'Bad request: $message';
      break;
    case 401:
      message = 'Unauthorized: $message';
      break;
    case 403:
      message = 'Forbidden: $message';
      break;
    case 404:
      message = 'Not found: $message';
      break;
    case 500:
      message = 'Internal server error: $message';
      break;
    default:
      // biarkan message apa adanya
      break;
  }

  debugPrint('DioException: $statusCode $message');

  return ServerException(message: message);
}
