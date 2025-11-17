import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
      ).copyWith(bottom: 16.0.h, top: 32.0.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: AppStyles.informationBodyStyle),
              Text('\$120.00', style: AppStyles.informationBodyStyle),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('VAT (15%)', style: AppStyles.informationBodyStyle),
              Text('\$18.00', style: AppStyles.informationBodyStyle),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Shipping Fees', style: AppStyles.informationBodyStyle),
              Text('\$12.00', style: AppStyles.informationBodyStyle),
            ],
          ),
          SizedBox(height: 24.h),
          Divider(
            thickness: 1,
            color: AppColors.secondaryColor.withValues(alpha: 0.5),
            endIndent: 16.0.w,
            indent: 16.0.w,
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
