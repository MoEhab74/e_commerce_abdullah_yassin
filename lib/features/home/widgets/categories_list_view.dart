import 'dart:developer';

import 'package:e_commerce/core/ui/loading_lottie.dart';
import 'package:e_commerce/features/home/cubits/categories/cubit.dart';
import 'package:e_commerce/features/home/cubits/categories/state.dart';
import 'package:e_commerce/features/home/cubits/products/cubit.dart';
import 'package:e_commerce/features/home/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int selectedIndex = 0;
  List<String>? categories;
  @override
  void initState() {
    _loadCategories();
    log('CategoriesListView called');
    super.initState();
  }

  // Fetch categories from Cubit
  _loadCategories() {
    context.read<CategoriesCubit>().fetchAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: SizedBox(
        height: 50.0,
        child: BlocBuilder<CategoriesCubit, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoadingState) {
              return const Center(child: LoadingLottie());
            } else if (state is CategoriesFailureState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is CategoriesSuccessState) {
              categories = state.categories;
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      // Handle category selection logic here
                      // getProductsByCategory Method
                      index == 0
                          ? context.read<ProductSCubit>().getAllProducts()
                          : context.read<ProductSCubit>().getProductsByCategory(
                              categories![index],
                            );
                    },
                    child: CategoryItem(
                      margin: index + 1 == categories?.length
                          ? const EdgeInsets.only(right: 16.0)
                          : null,
                      category: categories![index],
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 8.0),
                itemCount: categories!.length,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
