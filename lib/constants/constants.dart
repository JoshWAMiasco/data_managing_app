import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Constants {
  // UI ---------------------------------------------------------------------------------
  static EdgeInsets margin = EdgeInsets.only(left: 17.sp, right: 17.sp);
  static final dialogBorderRadius = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.sp),
  );
  // ------------------------------------------------------------------------------------

  // app colors -------------------------------------------------------------------------
  static const Color primaryColor = Color(0xFF204B6E);
  static const Color backgroundColor = Color(0xFFF9FAFB);
  static const Color disableColor = Color.fromARGB(255, 214, 214, 214);
  static const Color borderColor = Color(0xFF305F7C);
  static const Color lightBlueColor = Color(0xFFF4F7FA);
  static const Color darkColor = Color(0xFF343440);
  static const Color red = Color(0xFFC84E4E);
  static Color shimmerColor = Colors.grey.shade200;
  //--------------------------------------------------------------------------------------

  // app assets ---------------------------------------------------------------------------
  static const String appIcon = 'assets/dma_icon.png';
  // --------------------------------------------------------------------------------------
}
