// List of carts parser (for API responses that return arrays)
List<CartModel> cartListFromJson(List<dynamic> jsonList) =>
    List<CartModel>.from(jsonList.map((x) => CartModel.fromJson(x)));

class CartModel {
    int id;
    int userId;
    DateTime? date;
    List<Product> products;
    int v;

    CartModel({
        required this.id,
        required this.userId,
        this.date,
        required this.products,
        required this.v,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) {
        return CartModel(
            id: json['id'],
            userId: json['userId'],
            date: json['date'] != null ? DateTime.parse(json['date']) : null,
            products: List<Product>.from(json['products'].map((x) => Product.fromJson(x))),
            v: json['__v'] ?? 0,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'userId': userId,
            'date': date?.toIso8601String(),
            'products': products.map((x) => x.toJson()).toList(),
            '__v': v,
        };
    }

}

class Product {
    int productId;
    int quantity;

    Product({
        required this.productId,
        required this.quantity,
    });

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            productId: json['productId'],
            quantity: json['quantity'],
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'productId': productId,
            'quantity': quantity,
        };
    }

}
