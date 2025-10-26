
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color? color;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        fixedSize: Size(width?.w ?? 331.w, height?.h ?? 56.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 8.r),
        ),
      ),
      child: Text(
        text,
        style: AppStyles.buttonTextStyle,
      ),
    );
  }
}
