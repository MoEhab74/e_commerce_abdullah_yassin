import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/core/ui/auth_or_verify_hint.dart';
import 'package:e_commerce/core/ui/hight_or_width_space.dart';
import 'package:e_commerce/core/ui/primary_button_widget.dart';
import 'package:e_commerce/core/ui/primary_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ).w.copyWith(bottom: 10).h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login to your account',
                style: AppStyles.primaryHeadLinesStyle,
              ),
              HightOrWidthSpace(height: 8.0),
              Text(
                'It’s great to see you again.',
                style: AppStyles.subTitlesStyle,
              ),
              HightOrWidthSpace(height: 24.0),
              Text('User Name', style: AppStyles.bodyBlackStyle),
              HightOrWidthSpace(height: 4.0),
              AppTextFormField(hintText: 'Enter your user name'),
              HightOrWidthSpace(height: 16.0),
              Text('Password', style: AppStyles.bodyBlackStyle),
              HightOrWidthSpace(height: 4.0),
              AppTextFormField(
                hintText: 'Enter your password',
                obscureText: true,
                isPassword: true,
              ),
              HightOrWidthSpace(height: 55.0),
              Center(
                child: AppButton(
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    // Handle login action
                  },
                  text: 'Login',
                ),
              ),
              HightOrWidthSpace(height: 350.0),
              Center(
                child: AuthenticationOrVerificationHint(
                  questionText: 'Already have an account?',
                  actionText: 'Sign Up',
                  onTap: () {
                    // Handle sign up action
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
