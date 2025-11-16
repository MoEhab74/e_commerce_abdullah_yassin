import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantitySelector extends StatelessWidget {
  const QuantitySelector({
    super.key, required this.icon, this.onTap, this.iconPadding,
  });
  final IconData icon ;
  final VoidCallback? onTap ;
  final EdgeInsetsGeometry? iconPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryColor.withValues(
            alpha: 0.3,
          ),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: IconButton(
        padding: iconPadding ?? EdgeInsets.zero,
        onPressed: onTap,
        icon: Center(
          child: Icon(
            icon,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
