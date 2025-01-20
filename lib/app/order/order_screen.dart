import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/order/widget/product_checkout_card.dart';
import 'package:ecommerce_test/app/payment_method/payment_method_screen.dart';
import 'package:ecommerce_test/app/payment_method/widget/payment_method_card.dart';
import 'package:ecommerce_test/app/widgets/base_scaffold.dart';
import 'package:ecommerce_test/app/widgets/custom_button.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/models/payment_method_model.dart';
import 'package:ecommerce_test/providers/provider.dart';
import 'package:ecommerce_test/services/navigation/animated_navigation_service.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderScreen extends ConsumerStatefulWidget {
  const OrderScreen({super.key});

  @override
  ConsumerState<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends ConsumerState<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(RiverpodProvider.myCartProvider);
    return BaseScaffold(
        title: "Order",
        bottomNavBar: Container(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 25.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r)),
            color: AppColors.white,
          ),
          child: CustomButton(
            label: "Pay ${currencyFormatter(vm.totalPrice.toString())}",
            onPressed: () {
              dialogService.showSnackBar("Payment Successful", appToastType: AppToastType.success);
             for(int i = 0; i<3; i++){
              navigationService.goBack();
             }
            },
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  "Address",
                  fontSize: 18.sp,
               fontWeight: FontWeight.bold,
                ),
                Image.asset(
                  AppIcons.editIcon,
                  height: 20.sp,
                  width: 20.sp,
                  fit: BoxFit.fill,
                )
              ],
            ),
            Gap(10.h),
            CustomText(
              "Abdullahi Habiba",
              fontSize: 16.sp,
             fontWeight: FontWeight.bold,
            ),
            Gap(5.h),
            SizedBox(
                width: context.screenWidth,
                child: const CustomText(
                  "No. 56, Adekunle Adebayo Street, Isehin, Oyo State",
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w500,
                )),
            Gap(10.h),
            const Divider(
              color: AppColors.borderGrey1,
            ),
            Gap(20.h),
            CustomText(
              "Items",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              
            ),
            Gap(20.h),
            ...vm.cartList
                .where((e) => e.checkOut)
                .toList()
                .map((e) => ProductCheckoutCard(
                      data: e,
                    )),
            Gap(20.h),
            CustomText(
              "Shipping",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            Gap(20.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderGrey1),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.blue),
                          child: Image.asset(
                            AppImages.hsbcImg,
                            width: 35.w,
                            height: 21.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        CustomText(
                          "HSBC Express",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20.sp,
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ),
                  Gap(10.h),
                  const Divider(
                    color: AppColors.borderGrey1,
                  ),
                  Gap(10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              "Regular (\$5)",
                              fontSize: 14.sp,
                            ),
                            CustomText(
                              "Estimate time - 24 January",
                              fontSize: 12.sp,
                              color: AppColors.textGrey,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20.sp,
                          color: AppColors.black,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            CustomText(
              "Payment Method",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            Gap(20.h),
            PaymentMethodCard(
              data: vm.selectedCheckoutMethod,
              showRightArrow: false,
              isSelected: true,
              onTap: () async {
                final v = await animatedNavigationService.navigateTo(
                    destinationScreen: PaymentMethodScreen(
                      selected: vm.selectedCheckoutMethod,
                    ),
                    direction: SlideDirection.bottom);

                if (v != null && v is PaymentMethodModel) {
                  vm.selectedCheckoutMethod = v;
                }
              },
            )
          ],
        ));
  }
}
