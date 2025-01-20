import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/models/payment_method_model.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethodModel data;
  final VoidCallback? onTap;
  final bool showRightArrow;
  final bool isSelected;

  const PaymentMethodCard(
      {super.key,
      required this.data,
      this.isSelected = false,
      this.showRightArrow = true,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.borderGrey1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  data.icon,
                  height: data.title.toLowerCase() == "paypal" ?10.sp: 32.sp,
                  width:  32.sp,
                  fit: BoxFit.fill,
                ),
                Gap(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      data.title,
                      color: AppColors.black,
                    ),
                    data.subText != null
                        ? Padding(
                            padding: EdgeInsets.only(top: 5.sp),
                            child: CustomText(
                              data.subText ?? "",
                              color: AppColors.grey,
                              textType: TextType.tinyText,
                            ),
                          )
                        : const SizedBox(width:0),
                  ],
                )
              ],
            ),
            const Gap(5),
            showRightArrow
                ? Icon(
                    Icons.chevron_right,
                    size: 25.sp,
                    color: AppColors.black,
                  )
                : Container(
                    height: 24.sp,
                    width: 24.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: isSelected
                                ? AppColors.orange
                                : AppColors.borderGrey1,
                            width: isSelected ? 2.0 : 1.0)),
                    child: isSelected
                        ? Container(
                            height: 20.sp,
                            width: 20.sp,
                            margin: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.orange),
                          )
                        : const SizedBox(width:0),
                  )
          ],
        ),
      ),
    );
  }
}
