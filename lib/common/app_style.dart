import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(
  double size,
  Color color,
  FontWeight fw, {
  String fontName = 'poppins',
}) {
  switch (fontName.toLowerCase()) {
    case 'abhaya':
      return GoogleFonts.abhayaLibre(
          fontSize: size.sp, color: color, fontWeight: fw);
    case 'questrial':
      return GoogleFonts.questrial(
          fontSize: size.sp, color: color, fontWeight: fw);
    case 'roboto':
      return GoogleFonts.roboto(
          fontSize: size.sp, color: color, fontWeight: fw);
    case 'lato':
      return GoogleFonts.lato(fontSize: size.sp, color: color, fontWeight: fw);
    default:
      return GoogleFonts.poppins(
          fontSize: size.sp, color: color, fontWeight: fw);
  }
}
