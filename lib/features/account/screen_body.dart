import 'package:e_commerce/core/ui/app_divider.dart';
import 'package:e_commerce/core/ui/screen_title.dart';
import 'package:e_commerce/features/account/widgets/account_list_tile.dart';
import 'package:e_commerce/features/account/widgets/log_out_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ScreenTitle(title: 'My Account'),
          const AppDivider(
            indent: 24,
            endIndent: 24,
          ),
          SizedBox(height: 24.h),
          AccountListTile(
            title: 'My Orders',
            icon: Icons.shopping_bag,
            onTap: () {},
          ),
          const AppDivider(
            indent: 64,
            endIndent: 32,
          ),
          AccountListTile(
            title: 'My Details',
            icon: Icons.person,
            onTap: () {},
          ),
          const AppDivider(
            indent: 64,
            endIndent: 32,
          ),
          AccountListTile(
            title: 'Address Book',
            icon: Icons.location_on,
            onTap: () {},
          ),
          const AppDivider(
            indent: 64,
            endIndent: 32,
          ),
          AccountListTile(
            title: 'FAQs',
            icon: Icons.question_mark_outlined,
            onTap: () {},
          ),
          const AppDivider(
            indent: 64,
            endIndent: 32,
          ),
          AccountListTile(
            title: 'Help Center',
            icon: Icons.headset_mic,
            onTap: () {},
          ),
         const AppDivider(
            thickness: 8,
          ),
          SizedBox(height: 154.h),
          const LogOutButtom(),
        ],
      ),
    );
  }
}

