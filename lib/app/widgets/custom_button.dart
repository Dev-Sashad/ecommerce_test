import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.disabledOnPressed,
    this.label = 'Button',
    this.enabled = true,
    this.loading = false,
    this.secondary = false,
    this.fillColor,
    this.buttonTextColor = AppColors.white,
    this.borderColor = Colors.transparent,
  });

  final void Function()? onPressed;
  final void Function()? disabledOnPressed;
  final String label;
  final bool enabled;
  final bool loading;
  final bool secondary;
  final Color? fillColor;
  final Color buttonTextColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : disabledOnPressed ?? () {},
      child: Container(
        width: 327.w,
        height: 56.h,
        decoration: BoxDecoration(
          color: fillColor ??
              (secondary
                  ? null
                  : enabled
                      ? AppColors.black
                      : AppColors.buttonDisabled.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: loading
              ? SizedBox(
                  height: 16.h,
                  width: 16.w,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: AppColors.white,
                    ),
                  ),
                )
              : CustomText(
                  label,
                  color: buttonTextColor,
                  textType: TextType.mediumText,
                  fontWeight: FontWeight.w500,
                ),
        ),
      ),
    );
  }
}
