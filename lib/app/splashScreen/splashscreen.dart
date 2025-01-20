import 'dart:async';
import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/services/navigation/routes.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 4));
    goToLoginScreen();
  }

  void goToLoginScreen() {
    animatedNavigationService.navigateToAndRemoveAll(
      destinationScreen: AppRoute.dashboardScreen,
      animationDuration: 3000,
    );
  }


  @override
  void initState() {
    super.initState();
    init();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Icon(
          Icons.shopping_cart_outlined,
          size: 150.sp,
          color: AppColors.white,
        ),
      ),
    );
  }
}
