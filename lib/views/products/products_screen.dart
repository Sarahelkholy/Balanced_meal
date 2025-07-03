import 'package:balancedmeal/common/custom_appbar.dart';
import 'package:balancedmeal/controllers/products_controller.dart';
import 'package:balancedmeal/views/details/details_screen.dart';
import 'package:balancedmeal/views/orders/confirm_order.dart';
import 'package:balancedmeal/views/orders/widgets/order_summary.dart';
import 'package:balancedmeal/views/products/widgets/SectionHeading.dart';
import 'package:balancedmeal/views/products/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Create your order',
        onpress: () => Get.to(const DetailsScreen()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                SectionHeading(title: 'Vegetables'),
                ProductList(categoryFile: 'Vegetable'),
                SectionHeading(title: 'Meats'),
                ProductList(categoryFile: 'Meat'),
                SectionHeading(title: 'Carbs'),
                ProductList(categoryFile: 'Carb'),
              ],
            ),
          ),
          OrderSummaryList(
            controller: controller,
            btnText: 'Place Order',
            onTap: () {
              Get.to(ConfirmOrder());
            },
          ),
        ],
      ),
    );
  }
}
