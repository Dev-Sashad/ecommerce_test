import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/widgets/base_scaffold.dart';
import 'package:ecommerce_test/app/widgets/custom_button.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/models/product_model.dart';
import 'package:ecommerce_test/providers/provider.dart';
import 'package:ecommerce_test/services/navigation/routes.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/helpers.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  final ProductModel data;
  const ProductDetailsScreen({super.key, required this.data});

  @override
  ConsumerState<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen> {
  final CarouselSliderController controller = CarouselSliderController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (int i = 0; i < 3; i++) {
        ref
            .read(RiverpodProvider.productDetailsProvider)
            .addImage(widget.data.image);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(RiverpodProvider.productDetailsProvider);
    return BaseScaffold(
        backgroundColor: AppColors.backgroundGreyColor,
        showSuffix: true,
        showLike: true,
        isLiked: vm.like,
        onLikeClick: () => vm.like = !vm.like,
        bottomNavBar: ColoredBox(
          color: AppColors.white,
          child: Container(
            height: 100.h,
            padding:
                EdgeInsets.only(left: 25, right: 25, bottom: 20.h, top: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r)),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.5)
                ]),
            child: Row(
              children: [
                _action(icon: AppIcons.cartIcon, onTap: () {}),
                const Gap(15),
                Expanded(
                    child: CustomButton(
                  label: "Buy Now",
                  onPressed: () {
                    animatedNavigationService.navigateTo(
                        destinationScreen: AppRoute.myCartScreen);
                  },
                ))
              ],
            ),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 300.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: CarouselSlider(
                  items: vm.images
                      .map((e) => Image.asset(
                            e,
                            height: 300.h,
                            width: context.screenWidth,
                            fit: BoxFit.fill,
                          ))
                      .toList(),
                  carouselController: controller,
                  options: CarouselOptions(
                      height: 300.h,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 1.0,
                      autoPlayAnimationDuration: const Duration(seconds: 4),
                      autoPlayInterval: const Duration(seconds: 15),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        vm.currentIndex = index;
                      }),
                ),
              ),
            ),
            Gap(10.h),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (int i = 0; i < vm.images.length; i++)
                pageIndicator(
                  vm.currentIndex == i,
                  i,
                )
            ]),
            Gap(10.h),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 25, right: 20.w, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r)),
                color: AppColors.backgroundColor,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      widget.data.title,
                      maxLines: 1,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Image.asset(
                              AppIcons.ratingIcon,
                              color: AppColors.yellow,
                              height: 20.sp,
                              width: 20.sp,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Gap(5),
                          CustomText(
                            "4.8",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          const Gap(5),
                          const CustomText(
                            "(230 Review)",
                            textType: TextType.tinyText,
                            color: AppColors.grey,
                          )
                        ],
                      ),
                      CustomText(
                        "${currencyFormatter(widget.data.price.toString())}",
                        maxLines: 1,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Gap(10.h),
                  const Divider(
                    color: AppColors.borderGrey1,
                  ),
                  Gap(10.h),
                   const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      "Available Size",
                      textType: TextType.mediumText,
                      fontSize: 12,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...vm.sizes.map((e) => GestureDetector(
                            onTap: () => vm.selectedSize = e,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              margin: EdgeInsets.only(
                                  left: vm.sizes.indexOf(e) > 0 ? 15.sp : 0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: vm.selectedSize != e ? Colors.transparent : AppColors.orange ,
                                  border: Border.all(
                                      color: vm.selectedSize != e
                                          ? AppColors.borderGrey1
                                          : AppColors.backgroundColor)),
                              child: CustomText(
                                e.toString(),
                                textType: TextType.tinyText,
                                color: vm.selectedSize == e
                                    ? AppColors.white
                                    : AppColors.textGrey,
                              ),
                            ),
                          ))
                    ],
                  ),
                  Gap(20.h),
                   const Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      "Color",
                      textType: TextType.mediumText,
                      fontSize: 12,
                      color: AppColors.textGrey,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(7.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ...vm.colors.map((e) => GestureDetector(
                            onTap: () => vm.selectedColor = e,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              margin: EdgeInsets.only(
                                  left: vm.colors.indexOf(e) > 0 ? 15.sp : 0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: e,
                                  boxShadow: const [
                                    BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.5)
                                  ],
                                  border: Border.all(
                                      color: vm.selectedColor == e
                                          ? AppColors.red
                                          : AppColors.backgroundColor)),
                            ),
                          ))
                    ],
                  ),
                  Gap(20.h),
                ],
              ),
            ))
          ],
        ));
  }

  Widget _action({
    VoidCallback? onTap,
    required String icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.borderGrey1)),
        child: Image.asset(
          icon,
          color: AppColors.black,
          width: 24.0.sp,
          height: 24.0.sp,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget pageIndicator(
    bool isCurrentPage,
    int index,
  ) {
    return Container(
      margin: EdgeInsets.only(left: index > 0 ? 5 : 0),
      height: 8,
      width: isCurrentPage ? 30 : 8,
      decoration: BoxDecoration(
          color: isCurrentPage ? AppColors.black : AppColors.grey,
          borderRadius: BorderRadius.circular(6)),
    );
  }
}
