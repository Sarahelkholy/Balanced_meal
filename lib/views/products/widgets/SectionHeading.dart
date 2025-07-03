import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String title;

  final EdgeInsetsGeometry padd;

  const SectionHeading(
      {super.key,
      required this.title,
      this.padd = const EdgeInsets.symmetric(vertical: 6, horizontal: 8)});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padd,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ReusableText(
              text: title, style: appStyle(20, Ktext, FontWeight.w500)),
        ],
      ),
    );
  }
}
