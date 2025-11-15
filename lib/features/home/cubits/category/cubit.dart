import 'package:e_commerce/features/home/cubits/category/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  List<String> categories = [
    'All',
    'Tshirts',
    'Jeans',
    'Shirts',
    'Jackets',
    'Shoes',
    'Accessories',
  ];
  // Simulate fetching categories
  void fetchCategories() async {
    emit(CategoryLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError('Failed to load categories'));
    }
  }
}