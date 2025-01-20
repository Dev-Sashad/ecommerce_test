import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/my_cart/widget/my_cart_card.dart';
import 'package:ecommerce_test/app/widgets/base_scaffold.dart';
import 'package:ecommerce_test/app/widgets/custom_button.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/providers/provider.dart';
import 'package:ecommerce_test/services/navigation/routes.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCartScreen extends ConsumerStatefulWidget {
  const MyCartScreen({super.key});

  @override
  ConsumerState<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends ConsumerState<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(RiverpodProvider.myCartProvider);
    return BaseScaffold(
        title: "My Cart",
        showSuffix: true,
        showMore: true,
        bottomNavBar: Container(
          height: 220.h,
          padding:
              EdgeInsets.only(left: 25, right: 25,  top: 15.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r)),
              color: AppColors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.5)
              ]),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Select All",
                    textType: TextType.mediumText,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                  GestureDetector(
                      onTap: () =>
                          vm.allIsChecked ? vm.uncheckAll() : vm.checkAll(),
                      child: Icon(
                        vm.allIsChecked
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color:
                            vm.allIsChecked ? AppColors.orange : AppColors.grey,
                        size: 28.sp,
                      )),
                ],
              ),
              Gap(10.h),
              const Divider(
                color: AppColors.borderGrey1,
              ),
              Gap(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Total Payment",
                    textType: TextType.mediumText,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                  CustomText(
                    "${currencyFormatter(vm.totalPrice.toString())}",
                    textType: TextType.mediumText,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                  ),
                ],
              ),
              Gap(25.h),
              CustomButton(
                label: "Checkout",
                onPressed: () {
                  if(vm.cartList.where((e)=>e.checkOut).toList().isEmpty){
                     dialogService.showSnackBar(
                                  "Selecte atleast one item for Checkout.",
                                  appToastType: AppToastType.warning);
                  }else{
                  animatedNavigationService.navigateTo(
                      destinationScreen: AppRoute.orderScreen);
                  }
                },
              ),
            ],
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 25.sp),
          children: [
            Builder(builder: (c) {
              if (vm.cartList.isNotEmpty) {
                return AnimatedList(
                  physics: const NeverScrollableScrollPhysics(),
                  key: vm.listKey,
                  initialItemCount: vm.cartList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i, animation) {
                    return FadeTransition(
                        key: ValueKey(vm.cartList[i]),
                        opacity: animation,
                        child: MyCartCard(
                          data: vm.cartList[i],
                          onAdd: () {
                            final a = vm.cartList[i].selectedQuantity + 1;
                            vm.updateQuantity(data: vm.cartList[i], qty: a);
                          },
                          onSubtract: () {
                            if (vm.cartList[i].selectedQuantity > 1) {
                              final s = vm.cartList[i].selectedQuantity - 1;
                              vm.updateQuantity(data: vm.cartList[i], qty: s);
                            } else {
                              dialogService.showSnackBar(
                                  "Minimum quantity is 1",
                                  appToastType: AppToastType.warning);
                            }
                          },
                          onCheck: () {
                            final c = !vm.cartList[i].checkOut;
                            vm.updateCheckOut(
                                data: vm.cartList[i], isChecked: c);
                          },
                          onDelete: () {
                            vm.removeProductList(vm.cartList[i]);
                          },
                        ));
                  },
                );
              } else {
                return const Center(
                    child: CustomText(
                  "Your cart is empty",
                  textType: TextType.mediumText,
                  fontWeight: FontWeight.w600,
                ));
              }
            }),
            Gap(30.h),
          ],
        ));
  }
}
