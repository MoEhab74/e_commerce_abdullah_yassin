import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/core/ui/hight_or_width_space.dart';
import 'package:e_commerce/features/auth/sign_up/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                'Create an account',
                style: AppStyles.primaryHeadLinesStyle,
              ),
              HightOrWidthSpace(height: 8.0),
              Text(
                'Lest\'s create your account.',
                style: AppStyles.subTitlesStyle,
              ),
              HightOrWidthSpace(height: 24.0),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}