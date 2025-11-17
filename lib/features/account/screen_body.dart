import 'package:e_commerce/core/ui/screen_title.dart';
import 'package:flutter/material.dart';

class AccountScreenBody extends StatelessWidget {
  const AccountScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
         ScreenTitle(title: 'My Account'),
        ],
      )
    );
  }
}