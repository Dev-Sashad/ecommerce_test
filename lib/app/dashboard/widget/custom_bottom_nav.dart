import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavItem extends StatelessWidget {
  final bool isActive;
  final String icon;
  final VoidCallback onTap;
  const CustomBottomNavItem(
      {super.key, required this.isActive, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: 50.w,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              icon,
              color: isActive ? AppColors.white : AppColors.grey,
              width: 24.0,
              height: 24.0,
              fit: BoxFit.fill,
            ),
          isActive? const CircleAvatar(
              radius: 4,
              backgroundColor: AppColors.white,
            ): const SizedBox(width:0)
          ],
        ),
      ),
    );
  }
}
