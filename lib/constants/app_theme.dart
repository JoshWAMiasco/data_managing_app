import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'constants.dart';

class AppTheme {
  static ThemeData data(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        textTheme: GoogleFonts.notoSansTextTheme(),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp), borderSide: const BorderSide(color: Constants.borderColor, style: BorderStyle.solid, width: 1.0)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp), borderSide: const BorderSide(color: Colors.green, style: BorderStyle.solid, width: 1.0)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp), borderSide: const BorderSide(color: Constants.red, style: BorderStyle.solid, width: 1.0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.sp), borderSide: const BorderSide(color: Constants.borderColor, style: BorderStyle.solid, width: 1.0)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            side: MaterialStateProperty.resolveWith<BorderSide>((states) => const BorderSide(color: Constants.borderColor)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => Constants.primaryColor),
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.sp));
            }),
            textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) => const TextStyle(color: Colors.white)),
          ),
        ),
      );
}
