import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'quantity_selector.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.all(16.0).copyWith(bottom: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.secondaryColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          // Photo of the product
          Container(
            height: 90.h,
            width: 90.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://webandcrafts.com/_next/image?url=https%3A%2F%2Fadmin.wac.co%2Fuploads%2FWhat_is_E_commerce_and_What_are_its_Applications_2_d2eb0d4402.jpg&w=4500&q=90',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          // Column with product details
          Expanded(
            child: Column(
              children: [
                // Title, Size and Delete icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Name',
                          style: AppStyles.cartTitleStyle
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Size: M',
                          style: AppStyles.bodySmallGrayStyle,
                        ),
                      ],
                    ),
                    SizedBox(width: 40.w),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                          size: 24.sp,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Price and Quantity
                Row(
                  children: [
                    Text(
                      '\$99.99',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 40.w),
                    // Quantity Selector
                    QuantitySelector(
                      icon: Icons.remove,
                      onTap: () {},
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      ' 1 ',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    QuantitySelector(
                      icon: Icons.add,
                      onTap: () {},
                      iconPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
