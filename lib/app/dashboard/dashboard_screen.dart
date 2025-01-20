import 'package:ecommerce_test/app/dashboard/widget/custom_bottom_nav.dart';
import 'package:ecommerce_test/app/home/home_screen.dart';
import 'package:ecommerce_test/models/nav_model.dart';
import 'package:ecommerce_test/providers/provider.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  final pages = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  List<NavModel> navs = [
    NavModel(
      title: 'Home',
      icon: AppIcons.homeIcon,
    ),
    NavModel(
      title: 'Menu',
      icon: AppIcons.menuIcon,
    ),
    NavModel(
      title: 'Bookmark',
      icon: AppIcons.bookmarkIcon,
    ),
    NavModel(
      title: 'Cart',
      icon: AppIcons.cartIcon,
    ),
    NavModel(
      title: 'Profile',
      icon: AppIcons.userIcon,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(RiverpodProvider.dashboardProvider);

    return PopScope(
      canPop: false,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.white,
        body: pages[vm.currentTabIndex],
        bottomNavigationBar: Container(
          height: 100.h,
           padding: EdgeInsets.only(left: 25, right: 25, bottom: 20.h, top: 15.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
              color: AppColors.white,
              boxShadow:const [ BoxShadow(color: Colors.black12, blurRadius: 0.5, spreadRadius: 0.5)]
            ),
          child: Container(
            height: 72.h,
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: AppColors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: navs
                  .map(
                    (e) => CustomBottomNavItem(
                      icon: e.icon,
                      isActive: vm.currentTabIndex == navs.indexOf(e),
                      onTap: ()=>vm.currentTabIndex = navs.indexOf(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

