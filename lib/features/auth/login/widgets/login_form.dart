import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/core/ui/auth_or_verify_hint.dart';
import 'package:e_commerce/core/ui/hight_or_width_space.dart';
import 'package:e_commerce/core/ui/primary_button_widget.dart';
import 'package:e_commerce/core/ui/primary_text_form_field.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/auth/repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // Test the API call
    locator<AuthRepo>().login("johnd", "m38rmF\$").then((result) {
      result.fold(
        (failure) {
          // Handle failure
          debugPrint('Login failed: $failure');
        },
        (loginResponse) {
          // Handle success
          debugPrint('Login successful: ${loginResponse.toJson().toString()}');
        },
      );
    });
   return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User Name', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 4.0),
          AppTextFormField(
            hintText: 'Enter your user name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
          ),
          const HightOrWidthSpace(height: 16.0),
          Text('Password', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 4.0),
          AppTextFormField(
            hintText: 'Enter your password',
            obscureText: true,
            isPassword: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const HightOrWidthSpace(height: 55.0),
          Center(
            child: AppButton(
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
                // Handle login action
                // if (_formKey.currentState!.validate()) {
                //   // Login logic here from the cubit or bloc
                //   GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
                // }
              },
              text: 'Login',
            ),
          ),
          const HightOrWidthSpace(height: 350.0),
          Center(
            child: AuthenticationOrVerificationHint(
              questionText: 'Don\'t have an account? ',
              actionText: 'Join',
              onTap: () {
                // Handle sign up action
                GoRouter.of(context).push(AppRoutes.signUpScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}


 
    