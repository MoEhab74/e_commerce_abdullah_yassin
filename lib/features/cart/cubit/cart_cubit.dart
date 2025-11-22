import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/cart/cubit/cart_states.dart';
import 'package:e_commerce/features/cart/repo/cart_repo.dart';
import 'package:e_commerce/features/home/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  // get user cart

  Future<void> getUserCart() async {
    emit(CartLoading());

    final userCart = await locator<CartRepo>().getUserCart();

    userCart.fold(
      (error) => emit(CartError(error)),
      (cart) => emit(CartLoaded(cart)),
    );
  }

  // adding to cart

  Future<void> addToCart({required ProductModel product, required int quantity}) async {
    emit(AddingToCartState());

    final result = await locator<CartRepo>().addToCart(product, quantity);

    result.fold(
      (error) => emit(ErrorAddingToCartState(error)),
      (cart) => emit(SuccessAddingToCartState(cart)),
    );
  }

}