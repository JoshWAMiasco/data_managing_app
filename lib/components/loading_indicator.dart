import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_font.dart';
import '../constants/constants.dart';

class LoadingIndicator {
  static void show(BuildContext context, {String? title, String? content}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Builder(builder: (context) {
            return AlertDialog(
              backgroundColor: Constants.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              insetPadding: EdgeInsets.only(
                left: 30.w,
                right: 30.w,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30.sp,
                    width: 30.sp,
                    child: const CircularProgressIndicator(
                      color: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  Text(
                    'Please wait',
                    style: AppFont.h5WhiteBold(),
                  )
                ],
              ),
            );
          }),
        );
      },
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
