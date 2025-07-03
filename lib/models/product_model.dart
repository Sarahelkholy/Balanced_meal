import 'dart:convert';

class ProductModel {
  final String foodName;
  final int calories;
  final String imageUrl;
  int quantity;
  final double price;

  ProductModel(
      {required this.foodName,
      required this.calories,
      required this.imageUrl,
      this.quantity = 0,
      this.price = 12});

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        foodName: json["food_name"],
        calories: json["calories"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "food_name": foodName,
        "calories": calories,
        "image_url": imageUrl,
      };
}
