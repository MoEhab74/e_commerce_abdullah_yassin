import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_end_points.dart';
import 'package:e_commerce/core/api/dio_helper.dart';
import 'package:e_commerce/features/cart/models/cart_model.dart';
import 'package:e_commerce/features/home/models/product_model.dart';

class CartRepo {
  final DioHelper _dioHelper;
  CartRepo(this._dioHelper);

  // Get user cart method
  Future<Either<String, CartModel>> getUserCart() async {
    try {
      final response = await _dioHelper.getRequest('${ApiEndPoints.getCart}/2');
      if (response.isSuccess) {
        // FakeStore API returns an array of carts, we need the first one
        final cartList = response.data as List<dynamic>;
        
        if (cartList.isNotEmpty) {
          // Get the first cart from the list
          final cartData = cartList.first as Map<String, dynamic>;
          var cartModel = CartModel.fromJson(cartData);
          return Right(cartModel);
        } else {
          // If no carts found, create an empty cart
          final emptyCartData = {
            'id': 1,
            'userId': 2,
            'date': DateTime.now().toIso8601String(),
            'products': <Map<String, dynamic>>[],
            '__v': 0,
          };
          var cartModel = CartModel.fromJson(emptyCartData);
          return Right(cartModel);
        }
      } else {
        final String msg =
            response.errorMessage ??
            'Request failed (status: ${response.statusCode ?? 'unknown'})';
        return Left(msg);
      }
    } catch (e) {
      // Fallback to empty cart in case of any parsing errors
      final emptyCartData = {
        'id': 1,
        'userId': 2,
        'date': DateTime.now().toIso8601String(),
        'products': <Map<String, dynamic>>[],
        '__v': 0,
      };
      var cartModel = CartModel.fromJson(emptyCartData);
      return Right(cartModel);
    }
  }

  // FakeStore API doesn't support real cart mutations, so we simulate success
  Future<Either<String, CartModel>> addToCart(
    ProductModel product,
    int quantity,
  ) async {
    try {
      // In a real app, I'll store this locally or I'll use a real backend
      // Create a mock cart response that simulates successful request
      final mockCartData = {
        'id': 1,
        'userId': 2,
        'date': DateTime.now().toIso8601String(),
        'products': [
          {
            'productId': product.id,
            'quantity': quantity,
          }
        ],
        '__v': 0,
      };
      
      // Try to Post it to the API (even though it won't actually store it)
      final response = await _dioHelper.postRequest(
        '${ApiEndPoints.baseUrl}/carts',
        data: {
          'userId': 2,
          'date': DateTime.now().toIso8601String(),
          'products': [
            {
              'productId': product.id,
              'quantity': quantity,
            }
          ]
        },
      );
      
      if (response.isSuccess) {
        var cartModel = CartModel.fromJson(response.data);
        return Right(cartModel);
      } else {
        // Fall back to mock response for demo purposes
        var cartModel = CartModel.fromJson(mockCartData);
        return Right(cartModel);
      }
    } catch (e) {
      // Even if API fails, return mock success for demo
      final mockCartData = {
        'id': 1,
        'userId': 2,
        'date': DateTime.now().toIso8601String(),
        'products': [
          {
            'productId': product.id,
            'quantity': quantity,
          }
        ],
        '__v': 0,
      };
      
      var cartModel = CartModel.fromJson(mockCartData);
      return Right(cartModel);
    }
  }

  
}