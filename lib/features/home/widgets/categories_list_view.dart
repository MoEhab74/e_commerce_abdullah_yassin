import 'dart:developer';

import 'package:e_commerce/features/home/cubits/category/cubit.dart';
import 'package:e_commerce/features/home/cubits/category/states.dart';
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
    context.read<CategoryCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: SizedBox(
        height: 50.0,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            } else if (state is CategoryLoaded) {
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
                    },
                    child: CategoryItem(
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
