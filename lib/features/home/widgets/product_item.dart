// product_item.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/ui/loading_lottie.dart';
import 'package:e_commerce/features/home/models/product_model.dart';
import 'package:e_commerce/features/home/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, this.onTap, required this.product});
  final VoidCallback? onTap;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        // clipBehavior : Clip.antiAlias ===> to make the image rounded with the card
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              placeholder: (context, url) => const Center(
                child: LoadingLottie(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              imageUrl: product.image,
              width: double.infinity,
              height: 150.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 8.h),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Text(
              '\$${product.price}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
