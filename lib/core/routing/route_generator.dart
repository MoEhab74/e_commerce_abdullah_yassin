
import 'package:e_commerce/features/auth/login/login_screen.dart';
import 'package:e_commerce/features/auth/sign_up/screen.dart';
import 'package:e_commerce/features/home/screens/home_screen.dart';
import 'package:e_commerce/features/home/screens/product_details_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    initialLocation: AppRoutes.loginScreen,
    // List of Routes
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.productDetailsScreen,
        name: AppRoutes.productDetailsScreen,
        builder: (context, state) => const ProductDetailScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.otpVerificationView,
      //   name: AppRoutes.otpVerificationView,
      //   builder: (context, state) => const VerifyOtpView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.createNewPasswordView,
      //   name: AppRoutes.createNewPasswordView,
      //   builder: (context, state) => CreateNewPasswordView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.homeView,
      //   name: AppRoutes.homeView,
      //   builder: (context, state) => HomeView(),
      // ),
      
    ],
  );
}
