import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomAnimationWidget extends StatelessWidget {
  final List<Widget>? children;
  final Widget? child;
  final double? verticalOffset;
  final double? horizontalOffset;
  const CustomAnimationWidget(
      {super.key, this.children, this.horizontalOffset, this.verticalOffset, this.child});
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: Column(children: [
      ...AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 700),
          childAnimationBuilder: (widget) => SlideAnimation(
                verticalOffset: verticalOffset,
                horizontalOffset: horizontalOffset,
                child: FadeInAnimation(
                  child: widget,
                ),
              ),
          children: child != null ? [child ?? const SizedBox(width:0)] : (children ?? []))
    ]));
  }
}
