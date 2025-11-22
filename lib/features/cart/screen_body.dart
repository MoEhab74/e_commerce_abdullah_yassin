import 'package:e_commerce/core/themes/app_colors.dart';
import 'package:e_commerce/core/ui/primary_button_widget.dart';
import 'package:e_commerce/core/ui/screen_title.dart';
import 'package:e_commerce/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/cubit/cart_states.dart';
import 'package:e_commerce/features/cart/widgets/cart_item.dart';
import 'package:e_commerce/features/cart/widgets/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Title
                const ScreenTitle(title: 'My Cart'),
                // List of Cart Items
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CartError) {
                      return Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: TextStyle(fontSize: 16.sp, color: Colors.red),
                        ),
                      );
                    } else if (state is CartLoaded) {
                      final cartItems = state.cart.products;
                      if (cartItems.isEmpty) {
                        return Center(
                          child: Text(
                            'Your cart is empty',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: AppColors.grayColor,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final product = cartItems[index];
                          return CartItem(product: product);
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                SizedBox(height: 16.h),
                // subtotal, vat and shipping fees
                const OrderDetails(),
              ],
            ),
          ),
        ),
        // Checkout Button and Total Price
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Text(
                  '\$150.00',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        AppButton(
          text: 'Go to Checkout',
          onPressed: () {},
          padding: EdgeInsets.symmetric(vertical: 16.h),
        ),
      ],
    );
  }
}
