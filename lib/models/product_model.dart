import 'dart:convert';

class ProductModel {
  final String? id; // document ID from Firestore (null for local JSON)
  final String foodName;
  final int calories;
  final String imageUrl;
  int quantity;
  final double price;

  ProductModel({
    this.id,
    required this.foodName,
    required this.calories,
    required this.imageUrl,
    this.quantity = 0,
    this.price = 12.0,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map, {required String id}) {
    return ProductModel(
      id: id,
      foodName: map['food_name'] as String,
      calories: (map['calories'] as num).toInt(),
      imageUrl: map['image_url'] as String,
      quantity: map['quantity'] != null ? (map['quantity'] as num).toInt() : 0,
      price: map['price'] != null ? (map['price'] as num).toDouble() : 12.0,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: null,
      foodName: json['food_name'] as String,
      calories: (json['calories'] as num).toInt(),
      imageUrl: json['image_url'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'food_name': foodName,
        'calories': calories,
        'image_url': imageUrl,
        'quantity': quantity,
        'price': price,
      };

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());
}
