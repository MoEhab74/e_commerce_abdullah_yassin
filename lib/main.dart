import 'package:e_commerce/core/routing/route_generator.dart';
import 'package:e_commerce/core/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Finance App',
          debugShowCheckedModeBanner: false,
          theme: AppThemes.lightTheme,
          routerConfig: RouteGenerator.mainRoutingInOurApp,
        );
      },
    );
  }
}
