import 'dart:convert';

class OrderModel {
  final List<Item> items;

  OrderModel({
    required this.items,
  });

  factory OrderModel.fromRawJson(String str) =>
      OrderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  final String name;
  final int totalPrice;
  final int quantity;

  Item({
    required this.name,
    required this.totalPrice,
    required this.quantity,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        totalPrice: json["total_price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "total_price": totalPrice,
        "quantity": quantity,
      };
}
