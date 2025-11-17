import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  const LoadingLottie({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    // Defaults to a compact centered animation so it appears exactly
    // in the middle of the screen when shown.
    final double w = width ?? 100.0;
    final double h = height ?? 100.0;

    return Center(
      child: SizedBox(
        width: w,
        height: h,
        child: LottieBuilder.asset(
          'assets/lottie/loading_animation.json',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
