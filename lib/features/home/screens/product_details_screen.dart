import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/features/home/widgets/product_details_body.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
      ),
      body: const ProductsDetailsBody(),
    );
  }
}