class CategoryState {
  final List<String> categories;
  CategoryState(this.categories);
}
class CategoryInitial extends CategoryState {
  CategoryInitial() : super([]);
}
class CategoryLoading extends CategoryState {
  CategoryLoading() : super([]);
}
class CategoryLoaded extends CategoryState {
  CategoryLoaded(super.categories);
}
class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message) : super([]);
}