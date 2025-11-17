import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/core/ui/app_divider.dart';
import 'package:e_commerce/features/account/widgets/address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreenBody extends StatelessWidget {
  const AddressScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Address Book',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppDivider(indent: 8, endIndent: 8),
              SizedBox(height: 24.h),
              Text(
                'Saved Addresses',
                style: AppStyles.bodyBlackStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16.h),
              // Home
              AddressWidget(onTap: () {}),
              SizedBox(height: 16.h),
              // Office
              const AddressWidget(
                addressTitle: 'Office',
                addressDetails:
                    '456 Corporate Blvd, Metropolis, NY 10001, United States',
              ),
              SizedBox(height: 16.h),
              // Appartment
              const AddressWidget(
                addressTitle: 'Apartment',
                addressDetails: '789 Elm St, Gotham, NJ 07097, United States',
              ),
              SizedBox(height: 16.h),
              // Parent's House
              const AddressWidget(
                addressTitle: 'Parent\'s House',
                addressDetails:
                    '321 Oak Ave, Smalltown, TX 75001, United States',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

