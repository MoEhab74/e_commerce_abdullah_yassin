import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_end_points.dart';
import 'package:e_commerce/core/api/dio_helper.dart';
import 'package:e_commerce/features/auth/models/login_response_model.dart';

class AuthRepo {
  // login method
  Future<Either<String, LoginResponseModel>> login(
    String username,
    String password,
  ) async {
    
    final response = await DioHelper.postRequest(
      ApiEndPoints.login,
      // Instead of passing data like this, we can have a user model and pass its toJson() method
      data: {'username': username, 'password': password},
    );
    if (response.isSuccess) {
      log('Login successful: ${response.data}');
      // Login successful ===> Take the Token which is inside the response data and return it
      return Right(LoginResponseModel.fromJson(response.data));
    } else {
      // Better diagnostics for failures
      log('Login failed. statusCode=${response.statusCode}, data=${response.data},\nmessage=${response.errorMessage}');
      final String msg = response.errorMessage ?? 'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }
}
