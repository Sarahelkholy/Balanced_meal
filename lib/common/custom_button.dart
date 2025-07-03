import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//place or add to cart
class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.btnWidth,
    this.btnHeight,
    this.btnColor,
    this.radius,
    required this.text,
    this.textcolor,
    this.borderColor,
  });

  final void Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final Color? btnColor;
  final Color? textcolor;
  final Color? borderColor;
  final double? radius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? 327,
        height: btnHeight ?? 60,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Korange),
          color: btnColor ?? Korange,
          borderRadius: BorderRadius.circular(radius ?? 12.r),
        ),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(16, textcolor ?? Kwhite, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
