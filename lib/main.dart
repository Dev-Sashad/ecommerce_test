import 'package:ecommerce_test/services/navigation/navigator_service.dart';
import 'package:ecommerce_test/services/navigation/router.dart';
import 'package:ecommerce_test/services/navigation/routes.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:ecommerce_test/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => const BottomNavigation()),
    // );
  }

  displayDialog(String title, String body) {
    return showTopSnackBar(
      Overlay.of(NavigatorService.navigationKey_.currentContext!),
      CustomSnackBar.info(
        backgroundColor: AppColors.primaryColor,
        message: "$title\n$body",
      ),
    );
  }

 

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return StyledToast(
          locale: const Locale('en', 'US'),
          toastAnimation: StyledToastAnimation.slideFromTop,
          reverseAnimation: StyledToastAnimation.fade,
          toastPositions: StyledToastPosition.top,
          animDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 7),
          curve: Curves.elasticOut,
          reverseCurve: Curves.fastLinearToSlowEaseIn,
          dismissOtherOnShow: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            navigatorKey: navigationService.navigationKey,
            home: AppRoute.splashScreen,
            onGenerateRoute: generateRoute,
          ),
        );
      },
    );
  }
}
