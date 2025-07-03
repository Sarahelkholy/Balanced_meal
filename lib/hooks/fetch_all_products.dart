import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/product_model.dart';

Future<List<ProductModel>> fetchProducts(String fileName) async {
  final String response =
      await rootBundle.loadString('assets/data/$fileName.json');
  final List<dynamic> data = json.decode(response);
  return data.map((e) => ProductModel.fromJson(e)).toList();
}
