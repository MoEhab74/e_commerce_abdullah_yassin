import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/features/home/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/widgets/search_and_filter.dart';
import 'package:e_commerce/features/home/widgets/shop_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Text('Discover', style: AppStyles.primaryHeadLinesStyle),
          ),
          SizedBox(height: 16.0.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
            child: const SearchAndFilter(),
          ),
          SizedBox(height: 16.0.h),
          // Categories List View
          const CategoriesListView(),
          SizedBox(height: 16.0.h),
          const ShopBuilder(),
        ],
      ),
    );
  }
}



/*
Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    'Product ${index + 1}',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
              );
*/
