import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle({
  final double fontSize = 14.0,
  final FontWeight fontWeight = FontWeight.w400,
  final double lineHeight = 21.0,
  final TextAlign textAlign = TextAlign.center,
  Color color = Colors.black,
}) {
  return GoogleFonts.nunito(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    height: fontSize.sp / lineHeight.sp,
    color: color,
  );
}

TextStyle getTextStyleCabinCondensed({
  final double fontSize = 14.0,
  final FontWeight fontWeight = FontWeight.w400,
  final double lineHeight = 21.0,
  final TextAlign textAlign = TextAlign.center,
  Color color = Colors.black,
}) {
  return GoogleFonts.cabinCondensed(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    height: fontSize.sp / lineHeight.sp,
    color: color,
  );
}
