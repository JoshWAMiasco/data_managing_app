import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_font.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    this.labelText,
    this.controller,
    this.label,
    this.onEditingComplete,
    this.onChange,
    this.readOnly,
    this.onTap,
    this.style,
    this.suffixIcon,
    this.suffixString,
    this.maxLines,
    this.validator,
    this.textInputType,
    this.prefixIcon,
    this.errorText,
    this.obscureText = false,
    this.focusNode,
    this.textInputAction,
    this.maxLength,
    this.alignLabelWithHint,
    this.initialValue,
    this.isMandatory = false,
    this.inputFormatters,
    this.hideCounter = false,
    this.enable,
    this.boxConstraints,
  });
  final String? labelText;
  final TextEditingController? controller;
  final Widget? label;
  final Function()? onEditingComplete;
  final Function(String)? onChange;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextStyle? style;
  final Widget? suffixIcon;
  final String? suffixString;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Widget? prefixIcon;
  final String? errorText;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final bool? alignLabelWithHint;
  final String? initialValue;
  final bool? isMandatory;
  final List<TextInputFormatter>? inputFormatters;
  final bool? hideCounter;
  final bool? enable;
  final BoxConstraints? boxConstraints;
  @override
  Widget build(BuildContext context) {
    double adaptiveWidth = 100.w;
    if (Device.screenType == ScreenType.tablet) {
      adaptiveWidth = 50.w;
    }

    return SizedBox(
      width: adaptiveWidth,
      child: TextFormField(
        initialValue: initialValue,
        focusNode: focusNode,
        onTap: onTap,
        readOnly: readOnly ?? false,
        controller: controller,
        onEditingComplete: onEditingComplete,
        textInputAction: textInputAction,
        onChanged: onChange,
        maxLines: maxLines ?? 1,
        validator: validator,
        keyboardType: textInputType,
        obscureText: obscureText,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        enabled: enable,
        decoration: InputDecoration(
          isDense: true,
          labelText: isMandatory!
              ? null
              : label != null
                  ? null
                  : labelText,
          label: isMandatory!
              ? RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '*',
                        style: AppFont.h5DangerBold(),
                      ),
                      TextSpan(
                        text: labelText,
                        style: AppFont.h4DisableRegular(),
                      )
                    ],
                  ),
                )
              : label,
          alignLabelWithHint: alignLabelWithHint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixText: suffixString,
          contentPadding: EdgeInsets.all(15.sp),
          errorText: errorText,
          counterText: hideCounter! ? '' : null,
        ),
        style: style,
      ),
    );
  }
}
