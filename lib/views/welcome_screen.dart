import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/custom_button.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:balancedmeal/views/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16.w),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                opacity: .9,
                image: AssetImage("assets/welcomescreen.jpg"))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: ReusableText(
                    text: "Balanced Meal",
                    style: appStyle(48, Kwhite, FontWeight.w800,
                        fontName: 'abhaya'),
                  ),
                ),
              ),
              Column(
                children: [
                  ReusableText(
                    maxlines: 6,
                    align: TextAlign.center,
                    text:
                        "Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.",
                    style: appStyle(
                      20,
                      KwelcomeText,
                      FontWeight.w300,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 16.h,
                    ),
                    child: CustomButton(
                      text: 'Order Food',
                      onTap: () {
                        Get.to(const DetailsScreen());
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
