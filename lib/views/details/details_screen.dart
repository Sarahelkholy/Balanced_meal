import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/custom_appbar.dart';
import 'package:balancedmeal/common/custom_button.dart';
import 'package:balancedmeal/common/custom_text_container.dart';
import 'package:balancedmeal/controllers/products_controller.dart';
import 'package:balancedmeal/views/details/gender_container.dart';
import 'package:balancedmeal/views/products/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  bool next = false;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    _genderController.addListener(_checkIfReady);
    _heightController.addListener(_checkIfReady);
    _weightController.addListener(_checkIfReady);
    _ageController.addListener(_checkIfReady);
  }

  void _checkIfReady() {
    final ready = _genderController.text.isNotEmpty &&
        _heightController.text.isNotEmpty &&
        _weightController.text.isNotEmpty &&
        _ageController.text.isNotEmpty;

    if (ready != next) {
      setState(() {
        next = ready;
      });
    }
  }

  void calculateCals() {
    final ageText = _ageController.text.trim();
    final weightText = _weightController.text.trim();
    final heightText = _heightController.text.trim();
    final gender = _genderController.text.trim();

    final age = double.tryParse(ageText);
    final weight = double.tryParse(weightText);
    final height = double.tryParse(heightText);

    int cal;
    if (gender == "Male") {
      cal = ((666.47) + (13.75 * weight!) + (5 * height!) - (6.75 * age!))
          .toInt();
    } else {
      cal = ((655.1) + (9.56 * weight!) + (1.85 * height!) - (4.67 * age!))
          .toInt();
    }

    box.write('cal', cal);
    Get.put(ProductsController()).userCalories.value = cal;

    Get.snackbar('Done', 'You have $cal calories per day');

    Get.to(() => ProductsScreen());
  }

  @override
  void dispose() {
    _genderController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Enter your details',
        onpress: () => Get.back(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GenderDropdownMenu(controller: _genderController),
                    CustomTextContainer(
                      title: 'Weight',
                      hint: 'Enter your weight',
                      controller: _weightController,
                      suffix: "Kg",
                    ),
                    CustomTextContainer(
                      title: 'Height',
                      hint: 'Enter your height',
                      controller: _heightController,
                      suffix: 'Cm',
                    ),
                    CustomTextContainer(
                      title: 'Age',
                      controller: _ageController,
                      hint: 'Enter your age',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            CustomButton(
              text: 'Next',
              btnColor: next ? null : Kgreybutton,
              borderColor: next ? null : Kgreybutton,
              onTap: next
                  ? () {
                      calculateCals();
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
