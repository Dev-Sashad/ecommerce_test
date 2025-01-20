import 'package:ecommerce_test/app/widgets/custom_text.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/enums.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String value;
  final VoidCallback? onTap;
  final bool useMarging;

  const CategoryCard({super.key, required this.value, this.onTap, this.useMarging = true});
  @override
  Widget build(BuildContext context) {
   return Container(
    margin: useMarging? const EdgeInsets.only(left: 10): null,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.borderGrey1),
      borderRadius: const BorderRadius.horizontal(left: Radius.circular(30), right: Radius.circular(30))
    ),
    child: CustomText(value, textType: TextType.tinyText, fontWeight: FontWeight.w600,),
   );
  }
}