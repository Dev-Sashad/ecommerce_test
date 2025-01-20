import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_test/utils/app_colors.dart';

class SearchBox extends StatelessWidget {
  final String hint;

  const SearchBox({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(11.42)),
      child: SearchBar(
        elevation: WidgetStateProperty.all(0.0),
        backgroundColor: WidgetStateProperty.all(AppColors.white),
        padding: WidgetStateProperty.all(
          const EdgeInsets.only(left: 16.0, right: 0),
        ),
        leading: const Icon(
          Icons.search_outlined,
          color: AppColors.grey,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.42),
          ),
        ),
        hintText: hint,
        hintStyle: WidgetStateProperty.all(
            const TextStyle(color: AppColors.grey, fontSize: 16)),
      ),
    );
  }
}
