abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final List<String> categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesFailureState extends CategoriesState {
  final String errorMessage;

  CategoriesFailureState(this.errorMessage);
}
