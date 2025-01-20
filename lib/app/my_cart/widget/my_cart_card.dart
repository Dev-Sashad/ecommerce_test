import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/models/product_model.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:flutter/material.dart';

class MyCartCard extends StatelessWidget {
  final ProductModel data;
  final VoidCallback? onAdd;
  final VoidCallback? onSubtract;
  final VoidCallback? onDelete;
  final VoidCallback? onCheck;

  const MyCartCard(
      {super.key,
      required this.data,
      this.onAdd,
      this.onCheck,
      this.onDelete,
      this.onSubtract});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: onCheck,
                child: Icon(
                  data.checkOut
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  color: data.checkOut ? AppColors.orange : AppColors.grey,
                  size: 24.sp,
                )),
            Gap(20.sp),
            Stack(
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
            Gap(10.sp),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    data.title,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    maxLines: 2,
                  ),
                  const Gap(5),
                  CustomText(
                    "${currencyFormatter(data.price.toString())}",
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: AppColors.textGrey,
                  ),
                  Gap(15.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: onSubtract,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderGrey1),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.remove,
                                size: 20.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                          Gap(20.sp),
                          CustomText(data.selectedQuantity.toString()),
                          Gap(20.sp),
                          GestureDetector(
                            onTap: onAdd,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.borderGrey1),
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.add,
                                size: 20.sp,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: onDelete,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: AppColors.backgroundGreyColor,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.delete_outline,
                            size: 20.sp,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
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
