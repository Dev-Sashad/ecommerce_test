import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkErrorScreen extends StatelessWidget {
  const NetworkErrorScreen({
    super.key,
    required this.onPressed,
    required this.title,
  });
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/no_network.svg",
            width: context.screenWidth / 2.5,
            colorFilter: ColorFilter.mode(AppColors.primaryColor.withOpacity(0.6), BlendMode.color),
          ),
          const Text(
            'Oh no!',
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              elevation: WidgetStateProperty.all(2.0),
              backgroundColor: WidgetStateProperty.all<Color>(
                AppColors.white,
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 10.0,
              ),
              child: const Text(
                "Retry",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
