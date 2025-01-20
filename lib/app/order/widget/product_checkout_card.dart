import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/models/product_model.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:flutter/material.dart';

class ProductCheckoutCard extends StatelessWidget {
  final ProductModel data;
  const ProductCheckoutCard(
      {super.key,
      required this.data,});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
           height: 77.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 77.w,
                    width: 77.w,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundGreyColor,
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  Image.asset(
                    data.image,
                    height: 65.w,
                    width: 65.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Gap(10.sp),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      data.title,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      fontSize: 16.sp,
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          "${currencyFormatter(data.price.toString())}",
                          fontWeight: FontWeight.w500,
                          color: AppColors.textGrey,
                          fontSize: 14.sp,
                        ),
                         CustomText(
                          "X${data.selectedQuantity}",
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gap(10.h),
            const Divider(
              color: AppColors.borderGrey1,
            ),
        Gap(10.h),
      ],
    );
  }
}
