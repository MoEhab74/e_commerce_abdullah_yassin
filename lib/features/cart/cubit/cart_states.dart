import 'package:e_commerce/features/cart/models/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cart;
  CartLoaded(this.cart);
}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

class AddingToCartState extends CartState {}

class SuccessAddingToCartState extends CartState {
  final CartModel cart;
  SuccessAddingToCartState(this.cart);
}

class ErrorAddingToCartState extends CartState {
  final String message;
  ErrorAddingToCartState(this.message);
}
