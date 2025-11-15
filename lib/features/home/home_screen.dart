import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/features/home/widgets/categories_list_view.dart';
import 'package:e_commerce/features/home/widgets/search_and_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  'Discover',
                  style: AppStyles.primaryHeadLinesStyle,
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                child: SearchAndFilter(),
              ),
              const SizedBox(height: 16.0),
              // Categories List View
              CategoriesListView(),
              // Grid of products
              // GridView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //   ),
              //   itemBuilder: (context, index) {
              //     return Container(
              //       margin: const EdgeInsets.all(8.0),
              //       color: Colors.grey[300],
              //       height: 150.0,
              //       child: Center(
              //         child: Text('Product ${index + 1}'),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
