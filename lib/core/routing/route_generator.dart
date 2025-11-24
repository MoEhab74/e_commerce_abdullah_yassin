import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/account/screens/address_screen_body.dart';
import 'package:e_commerce/features/auth/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/login/login_screen.dart';
import 'package:e_commerce/features/auth/sign_up/screen.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/cubits/categories/cubit.dart';
import 'package:e_commerce/features/home/cubits/products/cubit.dart';
import 'package:e_commerce/features/home/screens/home_screen.dart';
import 'package:e_commerce/features/splash/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

class RouteGenerator {
  static GoRouter mainRoutingInOurApp = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    // List of Routes
    routes: [
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => locator<AuthCubit>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.homeScreen,
        name: AppRoutes.homeScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => locator<CategoriesCubit>()),
            BlocProvider(create: (context) => locator<ProductSCubit>()),
            BlocProvider(create: (context) => locator<CartCubit>()),
            BlocProvider(create: (context) => locator<AuthCubit>()),
          ],
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRoutes.signUpScreen,
        name: AppRoutes.signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.addressScreenBody,
        name: AppRoutes.addressScreenBody,
        builder: (context, state) => BlocProvider(
          create: (context) => locator<AuthCubit>(),
          child: const AddressScreenBody(),
        ),
      ),
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        builder: (context, state) => const SplachScreen(),
      ),
    ],
  );
}
