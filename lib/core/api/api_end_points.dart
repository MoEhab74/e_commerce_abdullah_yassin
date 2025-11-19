class ApiEndPoints {
  static const String baseUrl = "https://fakestoreapi.com";
  static const String login = "$baseUrl/auth/login";
  static const String register = "$baseUrl/users";
  static const String getProducts = "$baseUrl/products";
  static const String getAllCategories = "$baseUrl/products/categories"; // Don't forget to add category name at the end
  static const String getCart = "$baseUrl/carts/user/"; // Don't forget to add user id at the end
  static const String getAllUsers = "$baseUrl/users";
}