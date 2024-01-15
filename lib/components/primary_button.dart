import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.title,
    this.color = Constants.primaryColor,
    this.active = false,
    this.prefixIcon,
    this.sufixIcon,
    this.isPassword,
    this.isOutlined = false,
    this.icon,
    this.fontSize,
  });
  final VoidCallback? onPressed;
  final String title;
  final Color? color;
  final bool? active;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final bool? isPassword;
  final bool? isOutlined;
  final Widget? icon;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    double adaptiveWidth = 100.w;
    if (Device.screenType == ScreenType.tablet) {
      adaptiveWidth = 50.w;
    }

    return SizedBox(
      width: adaptiveWidth,
      height: 27.sp,
      child: TextButton(
        onPressed: () {
          if (active!) {
            onPressed!();
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: isOutlined!
              ? Colors.transparent
              : active!
                  ? color
                  : Constants.disableColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
            side: isOutlined! ? BorderSide(color: Constants.primaryColor, width: 5.sp) : BorderSide.none,
          ),
          //maximumSize: Size(double.minPositive, 27.sp),
        ),
        child: Builder(
          builder: (context) {
            if (icon != null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon!,
                  SizedBox(
                    width: 15.sp,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: isOutlined!
                          ? Constants.primaryColor
                          : active!
                              ? Colors.white
                              : Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: fontSize ?? 17.sp,
                    ),
                  )
                ],
              );
            }
            return Center(
              child: Text(
                title,
                style: TextStyle(
                  color: isOutlined!
                      ? Constants.primaryColor
                      : active!
                          ? Colors.white
                          : Colors.grey.shade500,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize ?? 17.sp,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
