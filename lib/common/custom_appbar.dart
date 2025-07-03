import 'package:balancedmeal/common/app_style.dart';
import 'package:balancedmeal/common/constants.dart';
import 'package:balancedmeal/common/reusable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function()? onpress;

  const CustomAppbar({super.key, required this.title, this.onpress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Kwhite,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          CupertinoIcons.arrowtriangle_left_fill,
          color: Ktext,
          size: 15,
        ),
        onPressed: onpress,
      ),
      title: ReusableText(
        text: title,
        style: appStyle(
          20,
          Ktext,
          FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
