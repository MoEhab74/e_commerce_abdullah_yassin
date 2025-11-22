import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/themes/app_styles.dart';
import 'package:e_commerce/core/ui/primary_button_widget.dart';
import 'package:e_commerce/core/utils/animated_snack_bar.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/cubit/cart_states.dart';
import 'package:e_commerce/features/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsDetailsBody extends StatelessWidget {
  const ProductsDetailsBody({super.key, required this.product});
  final ProductModel product;

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
                        image: CachedNetworkImageProvider(product.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Product title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.title,
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
                            text: product.rating?.rate.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' (${product.rating?.count ?? 0} reviews)',
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
                  product.description,
                  style: AppStyles.discriptionStyle,
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
                      text: '\$${product.price}',
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
              Expanded(
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is SuccessAddingToCartState) {
                      showAnimatedSnackbar(
                        context,
                        message: 'Product added to cart successfully!',
                        type: AnimatedSnackBarType.success,
                      );
                    } else if (state is ErrorAddingToCartState) {
                      showAnimatedSnackbar(
                        context,
                        message:
                            'Failed to add product to cart: ${state.message}',
                        type: AnimatedSnackBarType.error,
                      );
                    }
                  },

                  builder: (context, state) {
                    return AppButton(
                      text: state is AddingToCartState ? 'Adding...' : 'Add to Cart',
                      onPressed: state is AddingToCartState ? null : () {
                        // Add to cart from CartCubit
                        context.read<CartCubit>().addToCart(product: product);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
