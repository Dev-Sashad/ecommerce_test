import 'dart:async';
import 'package:ecommerce_test/services/dialog_service.dart';
import 'package:ecommerce_test/services/navigation/animated_navigation_service.dart';
import 'package:ecommerce_test/utils/base_model.dart';
import 'package:get_it/get_it.dart';

import '../services/navigation/navigator_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => BaseModel());
  locator.registerLazySingleton(() => AnimatedNavigationService());
  locator.registerLazySingleton(() => NavigatorService());
  locator.registerLazySingleton(() => DialogService());
}


// Services
final animatedNavigationService = locator<AnimatedNavigationService>();
final navigationService = locator<NavigatorService>();
final dialogService = locator<DialogService>();
