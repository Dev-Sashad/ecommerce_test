import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/models/product_model.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:flutter/material.dart';

class ProductFlashSaleCard extends StatelessWidget {
  final ProductModel data;
  final VoidCallback onTap;

  const ProductFlashSaleCard({super.key, required this.data, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: SizedBox(
        width: 120.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 120.w,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundGreyColor,
                        borderRadius: BorderRadius.circular(12.r)),
                  ),
                  Image.asset(
                    data.image,
                    height: 110.w,
                    width: 110.w,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Gap(5.sp),
            CustomText(data.title, fontWeight: FontWeight.w400, maxLines: 1,),
            CustomText("${currencyFormatter(data.price.toString())}", fontWeight: FontWeight.bold, maxLines: 1,),
          ],
        ),
      ),
    );
  }
}



class ProductHomeCard extends StatelessWidget {
  final ProductModel data;
  final VoidCallback onTap;

  const ProductHomeCard({super.key, required this.data, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: 155.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  height: 155.w,
                  width: 155.w,
                  decoration: BoxDecoration(
                      color: AppColors.backgroundGrey2Color,
                      borderRadius: BorderRadius.circular(12.r)),
                ),
                Image.asset(
                  data.image,
                  height: 130.w,
                  width: 130.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          Gap(5.sp),
          CustomText(data.title, fontWeight: FontWeight.w400, maxLines: 1, textType: TextType.mediumText,),
          CustomText("${currencyFormatter(data.price.toString())}", fontWeight: FontWeight.w600, maxLines: 1, textType: TextType.mediumText,),
        ],
      ),
    );
  }
}
