
import 'package:e_commerce/features/auth/login_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    initialLocation: AppRoutes.loginView,
    // List of Routes
    routes: [
      GoRoute(
        path: AppRoutes.loginView,
        name: AppRoutes.loginView,
        builder: (context, state) => LoginScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.loginView,
      //   name: AppRoutes.loginView,
      //   builder: (context, state) => LoginView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.registerView,
      //   name: AppRoutes.registerView,
      //   builder: (context, state) => const RegisterView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.forgotPasswordView,
      //   name: AppRoutes.forgotPasswordView,
      //   builder: (context, state) => const ForgetPassword(),
      // ),
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
