import 'package:e_commerce/core/routing/app_routes.dart';
import 'package:e_commerce/core/utils/secure_local_storage.dart';
import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    // waitAnimation and Navigate method
    waitAnimationAndNavigate();
  }

  waitAnimationAndNavigate() async {
    await _animationController.forward();
    _checkExistingToken();
  }

  void _checkExistingToken() {
    WidgetsBinding.instance.addPostFrameCallback((duration) {
      locator<SecureLocalStorageHelper>().readData('token').then((value) {
        if (value.isNotEmpty && value != '0') {
          GoRouter.of(context).pushReplacement(AppRoutes.homeScreen);
        } else {
          GoRouter.of(context).pushReplacement(AppRoutes.loginScreen);
        }
      });
    });
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScaleTransition(
        scale: _animation,
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 200.w,
            height: 200.h,
          ),
        ),
      ),
    );
  }
}
