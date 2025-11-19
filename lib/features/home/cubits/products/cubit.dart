import 'package:e_commerce/core/utils/service_locator.dart';
import 'package:e_commerce/features/home/cubits/products/state.dart';
import 'package:e_commerce/features/home/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSCubit extends Cubit<ProductsState> {
  ProductSCubit() : super(ProductsInitialState());

  Future<void> getAllProducts() async {
    emit(ProductsInitialState());

    final result = await locator<HomeRepo>().getAllProducts();

    result.fold(
      // On failure ( left )
      (error) => emit(ProductsFailureState(error)),
      // On success ( right )
      (products) => emit(ProductsSuccessState(products)),
    );
  }

  Future<void> getProductsByCategory(String categoryName) async {
    emit(ProductsInitialState());

    final result = await locator<HomeRepo>().getProductsByCategory(
      categoryName,
    );

    result.fold(
      (error) => emit(ProductsFailureState(error)),
      (products) => emit(ProductsSuccessState(products)),
    );
  }
}
