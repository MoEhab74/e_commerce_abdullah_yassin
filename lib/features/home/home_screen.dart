import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/features/home/widgets/search_and_filter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Discover', style: AppStyles.primaryHeadLinesStyle),
              SizedBox(height: 16.0),
              SearchAndFilter(),
            ],
          ),
        ),
      ),
    );
  }
}

