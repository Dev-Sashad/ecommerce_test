import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/home/widget/category_card.dart';
import 'package:ecommerce_test/app/product_details/product_details_screen.dart';
import 'package:ecommerce_test/app/widgets/base_scaffold.dart';
import 'package:ecommerce_test/app/widgets/custom_scroll.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/app/widgets/product_home_card.dart';
import 'package:ecommerce_test/providers/provider.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  static const Duration _duration = Duration(seconds: 60);
  AnimationController? animationController;
  Animation<double>? animation;
  bool continueAnimating = true;
  int hour = 08;
  int min = 25;
  double sec = 59;

  @override
  initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        if (animation!.value.toInt() <= 0 &&
            hour > 0 &&
            animationController!.isCompleted) {
          setState(() {
            if (min > 0) {
              min = min - 1;
            }
            if (min == 0) {
              min = 59;
              hour = hour - 1;
            }
            animationController!.reset();
            animationController!.forward();
          });
        }

        setState(() {});
      });
    animation = Tween(begin: sec, end: 0.0).animate(animationController!);
    animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(RiverpodProvider.homeScreenProvider);
    return BaseScaffold(
        prefix: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              "Discover",
              textType: TextType.largeText,
            ),
            CustomText("Find anything that you want",
                textType: TextType.tinyText,
                fontWeight: FontWeight.w500,
                color: AppColors.textGrey),
          ],
        ),
        showNotification: true,
        showSearch: true,
        showSuffix: true,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              height: 140.h,
              width: context.screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                      image: AssetImage(AppImages.adImg), fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        "Discounts",
                        textType: TextType.largeText,
                        fontSize: 30.sp,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.brown),
                        child: const CustomText("-15%",
                            textType: TextType.tinyText,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white),
                      )
                    ],
                  ),
                  Gap(10.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.textBlack),
                    child: const CustomText("See More",
                        textType: TextType.mediumText,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white),
                  )
                ],
              ),
            ),
            Gap(20.h),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: CustomScrollWidget(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: vm.categories
                      .map((e) => CategoryCard(
                            value: e,
                            useMarging: vm.categories.indexOf(e) != 0,
                          ))
                      .toList(),
                ),
              ),
            ),
            Gap(30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "Flash Sale",
                    textType: TextType.largeText,
                    fontSize: 16.sp,
                  ),
                  SizedBox(
                    width: 150.w,
                    height: 20,
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 0,
                          left: 0,
                          child: CustomText(
                            "Closing in:",
                            textType: TextType.tinyText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 60,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.sp),
                            color: AppColors.backgroundGreyColor,
                            height: 20,
                            width: 23,
                            alignment: Alignment.center,
                            child: CustomText(
                              hour.toString().length < 2
                                  ? "0${hour.toString()}"
                                  : hour.toString(),
                              fontSize: 10.sp,
                              textType: TextType.largeText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 30,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.sp),
                            color: AppColors.backgroundGreyColor,
                            height: 20,
                            width: 23,
                            alignment: Alignment.center,
                            child: CustomText(
                              min.toString().length < 2
                                  ? "0${min.toString()}"
                                  : min.toString(),
                              fontSize: 10.sp,
                              textType: TextType.largeText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            margin: EdgeInsets.only(left: 5.sp),
                            color: AppColors.backgroundGreyColor,
                            height: 20,
                            width: 23,
                            alignment: Alignment.center,
                            child: CustomText(
                              (animation!.value.toInt().toString().length > 1
                                  ? "${animation!.value.toInt()}"
                                  : "0${animation!.value.toInt() > 0 ? animation!.value.toInt() : 1}"),
                              fontSize: 10.sp,
                              textType: TextType.largeText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Gap(20.h),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: CustomScrollWidget(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: vm.flashSales
                      .map((e) => ProductFlashSaleCard(
                          data: e,
                          onTap: () {
                            animatedNavigationService.navigateTo(
                              destinationScreen: ProductDetailsScreen(data: e),
                            );
                          }))
                      .toList(),
                ),
              ),
            ),
            Gap(30.h),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        "Most Popular",
                        textType: TextType.largeText,
                        fontSize: 16.sp,
                      ),
                      const CustomText(
                        "See More",
                        fontWeight: FontWeight.w400,
                      ),
                    ])),
            Gap(20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: vm.popularSales.take(2)
                    .map((e) => ProductHomeCard(
                        data: e,
                        onTap: () {
                          animatedNavigationService.navigateTo(
                            destinationScreen: ProductDetailsScreen(data: e),
                          );
                        }))
                    .toList(),
              ),
            )
          ],
        ));
  }
}
