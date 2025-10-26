import 'package:dio/dio.dart';

class AppResponse {
  final bool isSuccess;
  final dynamic data;
  final DioException? exception;
  String? errorMessage;

  AppResponse({required this.isSuccess, this.data, this.exception}) {
    errorMessage = exception?.response?.data['message'] ?? exception?.message;
  }
}
