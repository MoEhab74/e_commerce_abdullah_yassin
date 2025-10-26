import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/core/ui/auth_or_verify_hint.dart';
import 'package:e_commerce/core/ui/hight_or_width_space.dart';
import 'package:e_commerce/core/ui/primary_button_widget.dart';
import 'package:e_commerce/core/ui/primary_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User Name', style: AppStyles.bodyBlackStyle),
          HightOrWidthSpace(height: 4.0),
          AppTextFormField(
            hintText: 'Enter your user name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your user name';
              }
              return null;
            },
          ),
          HightOrWidthSpace(height: 16.0),
          Text('Password', style: AppStyles.bodyBlackStyle),
          HightOrWidthSpace(height: 4.0),
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
          HightOrWidthSpace(height: 55.0),
          Center(
            child: AppButton(
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                // Handle login action
                if (_formKey.currentState!.validate()) {
                  // Login logic here from the cubit or bloc
                }
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
    );
  }
}
