import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextContainer extends StatelessWidget {
  const CustomTextContainer({
    super.key,
    this.controller,
    this.suffix,
    required this.title,
    this.hint,
  });

  final TextEditingController? controller;
  final String? suffix;
  final String title;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
              text: title, style: appStyle(14, Kgrey, FontWeight.w500)),
          SizedBox(height: 5.h),
          TextFormField(
            controller: controller,
            cursorColor: Kgrey,
            keyboardType: TextInputType.number,
            style: appStyle(16, Kgrey, FontWeight.w500),
            onChanged: (value) {},
            decoration: InputDecoration(
              filled: true,
              fillColor: Kwhite,
              hintText: hint,
              hintStyle: appStyle(16, Klightgrey, FontWeight.w400,
                  fontName: 'questrial'),
              suffixText: suffix,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Kborder, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Kborder, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Kborder, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
