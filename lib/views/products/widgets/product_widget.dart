import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/custom_button.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:balancedmeal/models/product_model.dart';
import 'package:balancedmeal/controllers/products_controller.dart';
import 'package:balancedmeal/views/products/widgets/quantity_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ProductsController controller = Get.put(ProductsController());

    return Container(
      height: 196.h,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      width: 183.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Kwhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                product.imageUrl,
                height: 108.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ReusableText(
                      text: product.foodName,
                      SoftWrap: true,
                      style: appStyle(16, Ktext, FontWeight.w400),
                    ),
                  ),
                  ReusableText(
                    text: '${product.calories} Cal',
                    SoftWrap: true,
                    style: appStyle(14, Klightgrey, FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text: "\$ ${product.price}",
                    style: appStyle(16, Ktext, FontWeight.w500),
                  ),
                  Obx(() {
                    final found = controller.selectedProducts.firstWhereOrNull(
                      (item) => item['foodName'] == product.foodName,
                    );
                    final qty = found != null ? found['quantity'] : 0;

                    return qty == 0
                        ? CustomButton(
                            text: 'Add',
                            onTap: () => controller.changeQuantity(product, 1),
                            btnHeight: 32.h,
                            btnWidth: 65.w,
                          )
                        : QuantityButtons(
                            product: product, initialQuantity: qty);
                  }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
