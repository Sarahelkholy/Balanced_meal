import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:balancedmeal/controllers/products_controller.dart';
import 'package:balancedmeal/models/product_model.dart';
import 'package:balancedmeal/views/products/widgets/quantity_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.find();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      height: 78.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Kwhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 76.w,
            height: 62.h,
            margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReusableText(
                        text: product.foodName,
                        style: appStyle(14, Ktext, FontWeight.w500),
                      ),
                    ),
                    ReusableText(
                      text: "\$ ${product.price}",
                      style: appStyle(16, Ktext, FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      text: '${product.calories} Cal',
                      style: appStyle(14, Klightgrey, FontWeight.w400),
                    ),
                    Obx(() {
                      final found =
                          controller.selectedProducts.firstWhereOrNull(
                        (item) => item['foodName'] == product.foodName,
                      );
                      final qty = found != null ? found['quantity'] : 0;

                      return QuantityButtons(
                        product: product,
                        initialQuantity: qty,
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
