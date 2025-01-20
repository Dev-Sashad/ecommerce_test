import 'package:ecommerce_test/app/dashboard/dashboard_screen.dart';
import 'package:ecommerce_test/services/navigation/route_names.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {

    case dashboardScreenRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const DashboardScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (BuildContext context) {
      return PopScope(
        canPop:  true,
        child: viewToShow,
      );
    },
  );
}
