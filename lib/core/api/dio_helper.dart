import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/app_response.dart';

class DioHelper {
  static const String baseUrl = 'https://thimar.amr.aait-d.com/api/';
  static final _dio = Dio(BaseOptions(baseUrl: baseUrl));

  static Future<AppResponse> getData(String path) async {
    // Tey-Catch for handling the request errors
    try {
      final response = await _dio.get(path);
      // status code for checking if the request is done successfully
      if (response.statusCode == 200) {
        return AppResponse(isSuccess: true, data: response.data);
      } else {
        return AppResponse(
          isSuccess: false,
        );
      }
    } on DioException catch (e) {
      return AppResponse(
        isSuccess: false,
        exception: e,
      );
    }
  }

  static Future<AppResponse> sendData(
    String path, {
    Map<String, dynamic>? data,
  }) async {
    // Try-Catch for handling the request errors
    try {
      final response = await _dio.post(path, data: data);
      // status code for checking if the request is done successfully
      if (response.statusCode == 200) {
        return AppResponse(isSuccess: true, data: response.data);
      } else {
        return AppResponse(
          isSuccess: false,
        );
      }
    } on DioException catch (e) {
      return AppResponse(
        isSuccess: false,
        exception: e,
      );
    }
  }
}
