import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/api/api_end_points.dart';
import 'package:e_commerce/core/api/dio_helper.dart';
import 'package:e_commerce/features/home/models/categories_model.dart';
import 'package:e_commerce/features/home/models/product_model.dart';

class HomeRepo {
  final DioHelper _dioHelper;
  HomeRepo(this._dioHelper);
  // Get all Products
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    List<ProductModel> products;
    final response = await _dioHelper.getRequest(ApiEndPoints.getProducts);
    if (response.isSuccess) {
      products = productModelFromJson(response.data);
      return Right(products);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }


  // Get all Categories

  Future<Either<String, List<String>>> getAllCategories() async {
    List<String> categories;
    final response = await _dioHelper.getRequest(ApiEndPoints.getAllCategories);
    if (response.isSuccess) {
      categories = categoriesModelFromJson(response.data);
      return Right(categories);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }


  // Get Products by Category

  Future<Either<String, List<ProductModel>>> getProductsByCategory(String categoryName) async {
    List<ProductModel> productsCategory;
    final response = await _dioHelper.getRequest(
      "${ApiEndPoints.getAllCategories}/$categoryName",
    );
    if (response.isSuccess) {
      productsCategory = productModelFromJson(response.data);
      return Right(productsCategory);
    } else {
      final String msg =
          response.errorMessage ??
          'Request failed (status: ${response.statusCode ?? 'unknown'})';
      return Left(msg);
    }
  }
}