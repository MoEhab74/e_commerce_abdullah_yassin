// List of products

// Original (concise but harder to read)
List<ProductModel> productModelFromJson(List<dynamic> productsJson) =>
    List<ProductModel>.from(productsJson.map((x) => ProductModel.fromJson(x)));

// More readable version (same functionality)

// List<ProductModel> productModelFromJsonReadable(List<dynamic> productsJson) {
//   List<ProductModel> products = [];
  
//   for (var jsonProduct in productsJson) {
//     ProductModel product = ProductModel.fromJson(jsonProduct);
//     products.add(product);
//   }
  
//   return products;
// }

class ProductModel {
  final String id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final RatingModel? rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: json['rating'] != null
          ? RatingModel.fromJson(json['rating'])
          : null,
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(rate: json['rate'].toDouble(), count: json['count']);
  }
}
