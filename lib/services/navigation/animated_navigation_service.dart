import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';

enum SlideDirection { left, top, right, bottom }

class AnimatedNavigationService {
  Future<dynamic> navigateTo({
    required Widget destinationScreen,
    int animationDuration = 600,
    SlideDirection direction = SlideDirection.right,
  }) {
    Route<dynamic> pageTransition = getPageTransition(
      animationDuration: animationDuration,
      destinationScreen: destinationScreen,
      direction: direction,
    );

   return navigationService.navigationKey.currentState!.push(pageTransition);
  }

  Future<dynamic> navigateToAndRemoveAll({
    required Widget destinationScreen,
    int animationDuration = 600,
    SlideDirection direction = SlideDirection.right,
  }) {
    Route<dynamic> pageTransition = getPageTransition(
      animationDuration: animationDuration,
      destinationScreen: destinationScreen,
      direction: direction,
    );

   return navigationService.navigationKey.currentState!.pushAndRemoveUntil(
      pageTransition,
      (Route<dynamic> route) => false,
    );
  }
}

Route<dynamic> getPageTransition({
  required SlideDirection direction,
  required Widget destinationScreen,
  required animationDuration,
}) {
  switch (direction) {
    case SlideDirection.left:
      return slideFromleftAnimatedTransition(
        time: animationDuration,
        screen: destinationScreen,
      );

    case SlideDirection.top:
      return slideFromTopAnimatedTransition(
        time: animationDuration,
        screen: destinationScreen,
      );

    case SlideDirection.right:
      return slideFromRightAnimatedTransition(
        time: animationDuration,
        screen: destinationScreen,
      );

    case SlideDirection.bottom:
      return slideFromBottomAnimatedTransition(
        time: animationDuration,
        screen: destinationScreen,
      );
  }
}

Route slideFromRightAnimatedTransition({
  required Widget screen,
  required int time,
}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: time),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route slideFromleftAnimatedTransition({
  required Widget screen,
  required int time,
}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: time),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route slideFromBottomAnimatedTransition({
  required Widget screen,
  required int time,
}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: time),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route slideFromTopAnimatedTransition({
  required Widget screen,
  required int time,
}) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: time),
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, -1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
