import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(
      json.decode(str).map((x) => Product.fromJson(x)),
    );

String productToJson(List<Product> data) =>
    json.encode(
      List<dynamic>.from(data.map((x) => x.toJson())),
    );

class Product {
  final String id;
  final String title;        // dari JSON: name
  final double price;        // dari JSON: price (int -> double)
  final String content;      // dari JSON: description
  final String category;
  final String? thumbnail;
  final int productsViews;
  final DateTime? createdAt; // bisa null
  final bool isFeatured;
  final int? userId;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.content,
    required this.category,
    required this.thumbnail,
    required this.productsViews,
    required this.createdAt,
    required this.isFeatured,
    required this.userId,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] as String,
        // JSON kirim "name" -> simpan ke field "title"
        title: json["name"] as String,
        // price di JSON biasanya int -> ubah ke double aman
        price: (json["price"] as num?)?.toDouble() ?? 0.0,
        // JSON kirim "description" -> simpan ke field "content"
        content: json["description"] as String,
        category: json["category"] as String,
        thumbnail: json["thumbnail"] as String?,
        productsViews: (json["products_views"] ?? 0) as int,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        isFeatured: (json["is_featured"] ?? false) as bool,
        userId: json["user_id"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": title,
        "price": price,
        "description": content,
        "category": category,
        "thumbnail": thumbnail,
        "products_views": productsViews,
        "created_at": createdAt?.toIso8601String(),
        "is_featured": isFeatured,
        "user_id": userId,
      };
}
