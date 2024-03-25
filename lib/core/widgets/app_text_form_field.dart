import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/theming/colors.dart';
import 'package:flutter_advanced_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintTextStyle;
  final bool? isObscureText;
  final Color? backGroundColor;
  final Widget? suffixIcon;
  final String hintText;
  final TextEditingController? controller;
  final Function(String?) validator;
  const AppTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.hintTextStyle,
    this.inputTextStyle,
    this.isObscureText,
    this.suffixIcon,
    this.backGroundColor,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => validator(value),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 18.h,
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.mainBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorsManager.lightGray,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        hintStyle: hintTextStyle ?? TextStyles.font14LightGrayRegular,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: backGroundColor ?? ColorsManager.evenLighterGray,
      ),
      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14DarkBlueMedium,
    );
  }
}
