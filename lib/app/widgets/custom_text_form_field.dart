import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final String? label;
  final int? maxLength;
  final int? maxLines;
  final dynamic validator;
  final bool? obscure;
  final bool? enable;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Color borderColor;
  final Color enableBorderColor;
  final Color disabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Widget? prefixIcon;
  final double borderRadius;
  final double borderWidth;
  final bool useUnderline;
  final bool useBorderColorForAll;
  final BorderStyle borderStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double prefixIconSpacing;

  const CustomTextFormField({
    super.key,
    this.hint,
    this.label,
    this.maxLength,
    this.maxLines,
    this.validator,
    this.obscure = false,
    this.enable = true,
    this.borderColor = AppColors.borderGrey1,
    this.enableBorderColor = AppColors.grey,
    this.disabledBorderColor = AppColors.borderGrey,
    this.focusedBorderColor = AppColors.primaryColor,
    this.errorBorderColor = AppColors.red,
    this.borderRadius = 5,
    this.borderWidth = 1.2,
    this.borderStyle = BorderStyle.solid,
    this.useUnderline = false,
    this.useBorderColorForAll = false,
    this.contentPadding,
    this.prefixIcon,
    this.inputType,
    this.controller,
    this.suffixIcon,
    this.inputFormatters,
    this.prefixIconSpacing = 14,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      obscureText: obscure!,
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      enabled: enable!,
      keyboardType: inputType ?? TextInputType.text,
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        contentPadding: contentPadding,
        labelText: label,
        hintText: hint,
        prefixIconConstraints: const BoxConstraints(maxHeight: 35, maxWidth: 40),
        prefixIcon: prefixIcon != null
            ? Row(
                children: [prefixIcon!, SizedBox(width: prefixIconSpacing.sp)],
              )
            : null,
        suffixIcon: suffixIcon,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Color(0xff8391A1),
        ),
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff8391A1),
        ),
        focusedBorder: useUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  width: borderWidth,
                  color:
                      useBorderColorForAll ? borderColor : focusedBorderColor,
                  style: borderStyle,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                  width: borderWidth,
                  color:
                      useBorderColorForAll ? borderColor : focusedBorderColor,
                  style: borderStyle,
                ),
              ),
        errorBorder: useUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  width: borderWidth,
                  color: useBorderColorForAll ? borderColor : errorBorderColor,
                  style: borderStyle,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                  width: borderWidth,
                  color: useBorderColorForAll ? borderColor : errorBorderColor,
                  style: borderStyle,
                ),
              ),
        disabledBorder: useUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  width: borderWidth,
                  color:
                      useBorderColorForAll ? borderColor : disabledBorderColor,
                  style: borderStyle,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                  width: borderWidth,
                  color:
                      useBorderColorForAll ? borderColor : disabledBorderColor,
                  style: borderStyle,
                ),
              ),
        enabledBorder: useUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  width: borderWidth,
                  color: useBorderColorForAll ? borderColor : enableBorderColor,
                  style: borderStyle,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                borderSide: BorderSide(
                  color: useBorderColorForAll ? borderColor : enableBorderColor,
                  width: borderWidth,
                  style: borderStyle,
                ),
              ),
        errorStyle: const TextStyle(color: AppColors.red),
        border: useUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                  width: borderWidth,
                  color: borderColor,
                  style: borderStyle,
                ),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  style: borderStyle,
                  color: borderColor,
                  width: borderWidth,
                ),
              ),
      ),
    );
  }
}
