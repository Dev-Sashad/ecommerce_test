import 'package:ecommerce_test/app/dashboard/provider/dashboard_provider.dart';
import 'package:ecommerce_test/app/home/provider/home_screen_provider.dart';
import 'package:ecommerce_test/app/my_cart/provider/my_cart_provider.dart';
import 'package:ecommerce_test/app/product_details/provider/product_details_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodProvider {
  
    static final dashboardProvider =
      ChangeNotifierProvider<DashboardProvider>((ref) => DashboardProvider());

     static final homeScreenProvider =
      ChangeNotifierProvider<HomeScreenProvider>((ref) => HomeScreenProvider());

    static final productDetailsProvider =
      ChangeNotifierProvider.autoDispose<ProductDetailsProvider>((ref) => ProductDetailsProvider());

     static final myCartProvider =
      ChangeNotifierProvider.autoDispose<MyCartProvider>((ref) => MyCartProvider());
}
