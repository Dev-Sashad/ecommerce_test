import 'package:flutter/material.dart';

class CustomScrollWidget extends StatelessWidget {
  final Widget? child;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  const CustomScrollWidget(
      {super.key, this.child,
      this.scrollDirection = Axis.vertical,
      this.physics,
      this.controller});
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
        child: SingleChildScrollView(
          scrollDirection: scrollDirection,
          controller: controller,
          physics: physics,
          child: child,
        ));
  }
}

class CustomScrollBehaviorWidget extends StatelessWidget {
  final Widget child;

  const CustomScrollBehaviorWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: const MaterialScrollBehavior().copyWith(overscroll: false),
        child: child);
  }
}
