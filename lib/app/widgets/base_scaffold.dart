import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? prefix;
  final bool showSearch;
  final bool showNotification;
  final bool showLike;
  final bool showMore;
  final bool showSuffix;
  final VoidCallback? onSearchClick;
  final VoidCallback? onNotificationClick;
  final VoidCallback? onLikeClick;
  final VoidCallback? onMoreClick;
  final Widget? bottomNavBar;
  final Color? backgroundColor;
  final bool? isLiked;

  const BaseScaffold({
    super.key,
    required this.child,
    this.title,
    this.prefix,
    this.backgroundColor,
    this.onLikeClick,
    this.onMoreClick,
    this.onNotificationClick,
    this.onSearchClick,
    this.showLike = false,
    this.showMore = false,
    this.showNotification = false,
    this.isLiked = false,
    this.showSearch = false,
    this.showSuffix = false,
    this.bottomNavBar,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ??  AppColors.backgroundColor,
      bottomNavigationBar: bottomNavBar,
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: SizedBox(
                  width: context.screenWidth,
                  height: 50.h,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          child: prefix ??
                              _action(
                                  iconData: Icons.chevron_left,
                                  isVisible: true,
                                  useMargin: false,
                                  onTap: () => navigationService.goBack())),
                      title != null
                          ? CustomText(
                              title ?? "",
                              fontWeight: FontWeight.w600,
                              textType: TextType.largeText,
                            )
                          : const SizedBox(width:0),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: showSuffix
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    _action(
                                        icon: AppIcons.searchIcon,
                                        isVisible: showSearch,
                                        onTap: onSearchClick),
                                    _action(
                                        icon: AppIcons.notificationIcon,
                                        isVisible: showNotification,
                                        onTap: onNotificationClick),
                                    _action(
                                        iconData: isLiked! ? Icons.favorite : Icons.favorite_outline,
                                        isVisible: showLike,
                                        iconDataColor: isLiked! ? AppColors.red : AppColors.black,
                                        onTap: onLikeClick),
                                    _action(
                                        iconData: Icons.more_horiz,
                                        isVisible: showMore,
                                        onTap: onMoreClick),
                                  ],
                                )
                              : const SizedBox(width:0)),
                    ],
                  ),
                ),
              ),
              Gap(20.h),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }

  Widget _action(
      {VoidCallback? onTap,
      IconData? iconData,
      String? icon,
      bool isVisible = false,
      Color iconDataColor = AppColors.black,
      bool useMargin = true}) {
    return isVisible
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              margin: useMargin ? const EdgeInsets.only(left: 8) : null,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: AppColors.borderGrey1)),
              child: icon != null
                  ? Image.asset(
                      icon,
                      color: AppColors.black,
                      width: 24.0.sp,
                      height: 24.0.sp,
                      fit: BoxFit.fill,
                    )
                  : Icon(
                      iconData,
                      size: 24.sp,
                      color: iconDataColor,
                    ),
            ),
          )
        : const SizedBox(width:0);
  }
}
