import 'package:balancedmeal/common/custom_appbar.dart';
import 'package:balancedmeal/controllers/products_controller.dart';
import 'package:balancedmeal/models/product_model.dart';
import 'package:balancedmeal/views/orders/widgets/order_summary.dart';
import 'package:balancedmeal/views/orders/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmOrder extends StatelessWidget {
  ConfirmOrder({super.key});
  final ProductsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Order summary',
        onpress: () => Get.back(),
      ),
      body: Column(
        children: [
          Obx(() {
            final products = controller.selectedProducts;

            if (products.isEmpty) {
              return const Center(child: Text("No items selected"));
            }

            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final item = products[index];
                  return ProductTile(
                    product: ProductModel(
                      foodName: item['foodName'],
                      calories: item['calories'],
                      imageUrl: item['imageUrl'],
                      price: item['price'],
                      quantity: item['quantity'],
                    ),
                  );
                },
              ),
            );
          }),
          OrderSummaryList(
            controller: controller,
            btnText: "Confirm Order",
            onTap: () {
              controller.confirmOrder();
            },
          )
        ],
      ),
    );
  }
}
