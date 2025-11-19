import 'package:e_commerce/features/cart/cubits/products/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSCubit extends Cubit<ProductsState>{
  ProductSCubit() : super(ProductsInitialState());
}