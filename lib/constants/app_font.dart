import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'constants.dart';

class AppFont {
  static final double _h1FontSize = 28.sp;
  static final double _h2FontSize = 20.sp;
  static final double _h3FontSize = 18.sp;
  static final double _h4FontSize = 16.sp;
  static final double _h5FontSize = 14.sp;

  static const Color _black = Constants.darkColor;
  static final Color _disable = Colors.grey.shade400;
  static const Color _primary = Constants.primaryColor;
  static const Color _danger = Colors.red;
  static const Color _success = Colors.green;
  static const Color _white = Colors.white;

  static TextStyle h1DarkBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h1FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h2DarkBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h2FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h3DarkBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h3FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h4DarkBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h4FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h5DarkBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h5FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h1DarkReqular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h1FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h2DarkReqular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h2FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h3DarkReqular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h3FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h4DarkReqular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h4FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h5DarkReqular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h5FontSize,
      color: _black,
      decoration: decoration,
    );
  }

  static TextStyle h1DisableBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h1FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h2DisableBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h2FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h3DisableBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h3FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h4DisableBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h4FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h5DisableBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h5FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h1DisableRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h1FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h2DisableRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h2FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h3DisableRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h3FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h4DisableRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h4FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h5DisableRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h5FontSize,
      color: _disable,
      decoration: decoration,
    );
  }

  static TextStyle h1PrimaryBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h1FontSize,
      color: _primary,
    );
  }

  static TextStyle h2PrimaryBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h2FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h3PrimaryBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h3FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h4PrimaryBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h4FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h5PrimaryBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h5FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h1PrimaryRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h1FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h2PrimaryRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h2FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h3PrimaryRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h3FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h4PrimaryRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h4FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h5PrimaryRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h5FontSize,
      color: _primary,
      decoration: decoration,
    );
  }

  static TextStyle h1DangerBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h1FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h2DangerBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h2FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h3DangerBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h3FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h4DangerBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h4FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h5DangerBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h5FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h1DangerRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h1FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h2DangerRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h2FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h3DangerRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h3FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h4DangerRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h4FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h5DangerRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h5FontSize,
      color: _danger,
      decoration: decoration,
    );
  }

  static TextStyle h1SuccessBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h1FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h2SuccessBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h2FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h3SuccessBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h3FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h4SuccessBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h4FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h5SuccessBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h5FontSize,
      color: _success,
    );
  }

  static TextStyle h1SuccessRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h1FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h2SuccessRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h2FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h3SuccessRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h3FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h4SuccessRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h4FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h5SuccessRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h5FontSize,
      color: _success,
      decoration: decoration,
    );
  }

  static TextStyle h1WhiteBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h1FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h2WhiteBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h2FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h3WhiteBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h3FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h4WhiteBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h4FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h5WhiteBold({TextDecoration? decoration}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: _h5FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h1WhiteRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h1FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h2WhiteRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h2FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h3WhiteRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h3FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h4WhiteRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h4FontSize,
      color: _white,
      decoration: decoration,
    );
  }

  static TextStyle h5WhiteRegular({TextDecoration? decoration}) {
    return TextStyle(
      fontSize: _h5FontSize,
      color: _white,
      decoration: decoration,
    );
  }
}
