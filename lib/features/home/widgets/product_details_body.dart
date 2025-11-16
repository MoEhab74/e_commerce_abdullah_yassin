import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_fonts.dart';
import 'package:e_commerce/core/ui/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsDetailsBody extends StatelessWidget {
  const ProductsDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Center(
                  child: Container(
                    height: 370.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://webandcrafts.com/_next/image?url=https%3A%2F%2Fadmin.wac.co%2Fuploads%2FWhat_is_E_commerce_and_What_are_its_Applications_2_d2eb0d4402.jpg&w=4500&q=90',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Product title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Fit Polo T-Shirt',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 24.sp),
                    SizedBox(width: 6.w),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '4.0/5 ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '(45 reviews)',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                // Product description
                SelectableText(
                  'Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them',
                  style: TextStyle(
                    fontFamily: AppFonts.secondaryFont,
                    fontSize: 16.sp,
                    height: 1.5,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey[300], thickness: 1),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
            vertical: 24.h,
          ).copyWith(top: 8.h),
          child: Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Price\n',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    TextSpan(
                      text: '\$149.99',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(child: AppButton(
                text: 'Add to Cart',
                onPressed: () {},
              )),
            ],
          ),
        ),
      ],
    );
  }
}
