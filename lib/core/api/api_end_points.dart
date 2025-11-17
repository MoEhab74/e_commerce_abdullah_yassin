class ApiEndPoints {
  static const String baseUrl = "https://fakestoreapi.com";
  static const String login = "/auth/login";
  static const String register = "/users";
  static const String getProducts = "/products";
  static const String getCatogriesORCategoryProducts = "/products/categories"; // Don't forget to add category name at the end
  static const String getCategory = "/products/categories";
  static const String getCart = "/carts/user/"; // Don't forget to add user id at the end
  static const String getAllUsers = "/users";
}