import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:balancedmeal/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:balancedmeal/models/product_model.dart';

class QuantityButtons extends StatefulWidget {
  const QuantityButtons({
    super.key,
    required this.product,
    this.initialQuantity = 0,
  });

  final ProductModel product;
  final int initialQuantity;

  @override
  State<QuantityButtons> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<QuantityButtons> {
  final ProductsController controller = Get.find();
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      quantity++;
    });
    controller.changeQuantity(widget.product, quantity);
  }

  void _decrement() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
      controller.changeQuantity(widget.product, quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: _decrement,
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
                color: Korange, borderRadius: BorderRadius.circular(100)),
            child: const Icon(Icons.remove, color: Kwhite, size: 18),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: ReusableText(
            text: "$quantity",
            style: appStyle(16, Ktext, FontWeight.w500),
          ),
        ),
        InkWell(
          onTap: _increment,
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
                color: Korange, borderRadius: BorderRadius.circular(100)),
            child: const Icon(Icons.add, color: Kwhite, size: 18),
          ),
        ),
      ],
    );
  }
}
