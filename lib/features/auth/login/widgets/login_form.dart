import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/core/ui/auth_or_verify_hint.dart';
import 'package:e_commerce/core/ui/hight_or_width_space.dart';
import 'package:e_commerce/core/ui/loading_lottie.dart';
import 'package:e_commerce/core/ui/primary_button_widget.dart';
import 'package:e_commerce/core/ui/primary_text_form_field.dart';
import 'package:e_commerce/core/utils/animated_snack_bar.dart';
import 'package:e_commerce/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/cubit/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User Name', style: AppStyles.bodyBlackStyle),
          const HightOrWidthSpace(height: 4.0),
          AppTextFormField(
            controller: _usernameController,
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
            controller: _passwordController,
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
          BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {
              // Here i'll handle the states for showing snackbars or navigation
              if (state is AuthFailureState) {
                showAnimatedSnackbar(
                  context,
                  message: state.errorMessage,
                  type: AnimatedSnackBarType.error,
                );
              } else if (state is AuthSuccessState) {
                showAnimatedSnackbar(
                  context,
                  message: 'Login Successful',
                  type: AnimatedSnackBarType.success,
                );
                // Navigate to home screen
                GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
              }
            },
            builder: (context, state) {
              // Different builder based on state
              if (state is AuthLoadingState) {
                return const Center(child: LoadingLottie());
              }
              return Center(
                child: AppButton(
                  color: AppColors.primaryColor,
                  textColor: AppColors.whiteColor,
                  onPressed: () {
                    // Handle login action
                    if (_formKey.currentState!.validate()) {
                      // Login logic here from the cubit or bloc
                      // Don't forget to replace with actual user inputs
                      context.read<AuthCubit>().login(
                        username: 'johnd',
                        password: r'm38rmF$',
                      );
                      // GoRouter.of(
                      //   context,
                      // ).pushReplacement(AppRoutes.homeScreen);
                    }
                  },
                  text: 'Login',
                ),
              );
            },
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
