import 'dart:convert';
import 'package:balancedmeal/models/order_model.dart';
import 'package:balancedmeal/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../views/products/products_screen.dart';

class ProductsController extends GetxController {
  final storage = GetStorage();

  RxDouble totalPrice = 0.0.obs;
  RxInt totalCalories = 0.obs;
  RxInt userCalories = 0.obs;

  RxList<Map<String, dynamic>> selectedProducts = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadStoredData();
  }

  void _loadStoredData() {
    totalPrice.value = storage.read('totalprice') ?? 0.0;
    totalCalories.value = storage.read('ordercal') ?? 0;
    userCalories.value = storage.read('cal') ?? 0;
    selectedProducts.value = (storage.read('selected_products') as List?)
            ?.cast<Map<String, dynamic>>() ??
        [];
  }

  void changeQuantity(ProductModel product, int quantity) {
    if (quantity < 0) quantity = 0;

    selectedProducts
        .removeWhere((item) => item['foodName'] == product.foodName);

    if (quantity > 0) {
      selectedProducts.add({
        'foodName': product.foodName,
        'quantity': quantity,
        'price': product.price,
        'calories': product.calories,
        'imageUrl': product.imageUrl,
      });
    }

    _recalculateTotals();

    storage.write('selected_products', selectedProducts);
    storage.write('totalprice', totalPrice.value);
    storage.write('ordercal', totalCalories.value);
  }

  Future<void> confirmOrder() async {
    try {
      final List<Item> items = selectedProducts.map((item) {
        return Item(
          name: item['foodName'],
          totalPrice:
              ((item['price'] as double) * (item['quantity'] as int)).round(),
          quantity: item['quantity'],
        );
      }).toList();

      final order = OrderModel(items: items);

      final response = await http.post(
        Uri.parse("https://uz8if7.buildship.run/placeOrder"),
        headers: {"Content-Type": "application/json"},
        body: order.toRawJson(),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        if (responseData['result'] == true) {
          selectedProducts.clear();
          totalPrice.value = 0.0;
          totalCalories.value = 0;
          storage.remove('selected_products');
          storage.remove('totalprice');
          storage.remove('ordercal');

          Get.snackbar("Success", "Order placed successfully");
          Get.offAll(() => ProductsScreen());
        } else {
          Get.snackbar("Error", "API rejected the order");
        }
      } else {
        Get.snackbar("Error", "Server error: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }

  void _recalculateTotals() {
    double price = 0;
    int cal = 0;
    for (var item in selectedProducts) {
      price += (item['price'] as double) * (item['quantity'] as int);
      cal += (item['calories'] as int) * (item['quantity'] as int);
    }
    totalPrice.value = price;
    totalCalories.value = cal;
  }
}
