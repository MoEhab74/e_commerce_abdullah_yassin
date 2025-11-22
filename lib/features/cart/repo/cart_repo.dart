import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_end_points.dart';
import 'package:e_commerce/core/api/dio_helper.dart';
import 'package:e_commerce/features/cart/models/cart_model.dart';
import 'package:e_commerce/features/home/models/product_model.dart';

class CartRepo {
  final DioHelper _dioHelper;
  CartRepo(this._dioHelper);

  // Get usr cart method
  Future<Either<String, CartModel>> getUserCart() async {
    final response = await _dioHelper.getRequest('${ApiEndPoints.getCart}/2');
    if (response.isSuccess) {
      var cartModel = CartModel.fromJson(response.data);
      return Right(cartModel);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }

  // Add to cart method ===> Using PUT request to simulate adding to cart
  Future<Either<String, CartModel>> addToCart(
    ProductModel product,
    int quantity,
  ) async {
    final response = await _dioHelper.putRequest(
      '${ApiEndPoints.getCart}/2',
      data: {
        'id' : 3,
        'userId' : 2,
        'products' : [
          {
            'productId' : product.id,
            'quantity' : quantity,
          }
        ]
      },
    );
    if (response.isSuccess) {
      var cartModel = CartModel.fromJson(response.data);
      return Right(cartModel);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }

  
}