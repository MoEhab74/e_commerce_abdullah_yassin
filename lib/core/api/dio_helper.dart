import 'package:dio/dio.dart';
import 'package:e_commerce/core/api/api_end_points.dart';
import 'package:e_commerce/core/api/app_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static const String baseUrl = ApiEndPoints.baseUrl;
  static final _dio = Dio(BaseOptions(baseUrl: baseUrl));
  static void init() {
    // Adding PrettyDioLogger for logging the requests in a pretty way
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }


  static Future<AppResponse> getRequest(String path) async {
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
  
  static Future<AppResponse> postRequest(
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
