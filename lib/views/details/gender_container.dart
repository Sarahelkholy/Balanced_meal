import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum GenderLabel {
  male('Male'),
  female('Female');

  const GenderLabel(this.label);
  final String label;

  static List<DropdownMenuEntry<GenderLabel>> buildEntries(
      GenderLabel? selected) {
    return values.map(
      (gender) {
        final isSelected = gender == selected;
        return DropdownMenuEntry<GenderLabel>(
          value: gender,
          label: gender.label,
          style: MenuItemButton.styleFrom(
            backgroundColor: isSelected ? Korange.withOpacity(0.3) : Kwhite,
            foregroundColor: isSelected ? Korange : Ktext,
          ),
          trailingIcon:
              isSelected ? const Icon(Icons.check, color: Korange) : null,
        );
      },
    ).toList();
  }
}

class GenderDropdownMenu extends StatefulWidget {
  const GenderDropdownMenu({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  State<GenderDropdownMenu> createState() => _GenderDropdownMenuState();
}

class _GenderDropdownMenuState extends State<GenderDropdownMenu> {
  GenderLabel? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 14.h, 8.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
            text: 'Gender',
            style: appStyle(14, Kgrey, FontWeight.w500),
          ),
          SizedBox(height: 5.h),
          SizedBox(
            child: DropdownMenu<GenderLabel>(
              controller: widget.controller,
              width: 0.87.sw,
              initialSelection: selectedGender,
              hintText: 'Choose your gender',
              textStyle: appStyle(
                16,
                Kgrey,
                FontWeight.w500,
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Kwhite,
                hintStyle: appStyle(16, Klightgrey, FontWeight.w400,
                    fontName: 'questrial'),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Kborder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Kborder),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: const BorderSide(color: Kborder),
                ),
              ),
              dropdownMenuEntries: GenderLabel.buildEntries(selectedGender),
              menuStyle: MenuStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.r), // no edges if you prefer flat
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(Kwhite),
              ),
              onSelected: (GenderLabel? gender) {
                setState(() {
                  selectedGender = gender;
                  widget.controller.text = gender?.label ?? '';
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
