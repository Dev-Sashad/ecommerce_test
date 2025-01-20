import 'package:ecommerce_test/app/dashboard/dashboard_screen.dart';
import 'package:ecommerce_test/app/my_cart/my_cart_screen.dart';
import 'package:ecommerce_test/app/order/order_screen.dart';
import 'package:ecommerce_test/app/splashScreen/splashscreen.dart';
import 'package:flutter/material.dart';

abstract class AppRoute {
  static const Widget splashScreen = SplashScreen();
  static const Widget dashboardScreen = DashboardScreen();
  static const Widget orderScreen = OrderScreen();
  static const Widget myCartScreen = MyCartScreen();
}
