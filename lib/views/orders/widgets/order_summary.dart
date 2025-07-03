import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/custom_button.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:balancedmeal/controllers/products_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSummaryList extends StatelessWidget {
  const OrderSummaryList({
    super.key,
    required this.controller,
    required this.btnText,
    this.onTap,
  });

  final ProductsController controller;
  final String btnText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Kwhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
      ),
      child: Obx(() {
        final int userCal = controller.userCalories.value;
        final int orderCal = controller.totalCalories.value;

        final int lower = (userCal * 0.9).round();
        final int upper = (userCal * 1.1).round();

        final bool isWithinRange = orderCal >= lower && orderCal <= upper;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: 'Cal',
                  style: appStyle(16, Ktext, FontWeight.w400),
                ),
                ReusableText(
                  text:
                      '${controller.totalCalories.value} Cal out of ${controller.userCalories.value} Cal',
                  style: appStyle(14, Klightgrey, FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(
                  text: 'Price',
                  style: appStyle(16, Ktext, FontWeight.w400),
                ),
                ReusableText(
                  text: '\$ ${controller.totalPrice.value.toStringAsFixed(2)}',
                  style: appStyle(16, Korange, FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: btnText,
              btnHeight: 50.h,
              btnWidth: double.infinity,
              btnColor: isWithinRange ? null : Kgreybutton,
              borderColor: isWithinRange ? null : Kgreybutton,
              onTap: isWithinRange ? onTap : null,
            ),
          ],
        );
      }),
    );
  }
}
