import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/auth/cubit/auth_states.dart';
import 'package:e_commerce/features/auth/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  // Login method

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(AuthLoadingState());
    await locator<AuthRepo>().login(username, password).then((result) {
      result.fold(
        (failure) {
          // Handle failure
          debugPrint('Login failed: $failure');
          emit(AuthFailureState(errorMessage: failure.toString()));
        },
        (loginResponse) {
          // Handle success
          debugPrint('Login successful: ${loginResponse.toJson().toString()}');
          emit(
            AuthSuccessState('Login successful', token: loginResponse.token),
          );
        },
      );
    });
  }

  Future<void> logOut() async {
    emit(AuthLoadingState());
    await locator<AuthRepo>().logOut().then((result) {
      result.fold(
        (failure) {
          debugPrint('Logout failed: $failure');
          emit(AuthFailureState(errorMessage: failure.toString()));
        },
        (_) {
          debugPrint('Logout successful');
          emit(AuthLoggedOutState());
        },
      );
    });
  }
}