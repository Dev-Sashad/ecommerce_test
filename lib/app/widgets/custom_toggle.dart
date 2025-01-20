import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final double height;
  final double width;

  const CustomToggle(
      {super.key,
      required this.value,
      required this.onChanged,
      this.height = 25,
      this.width = 50,
      this.activeColor = AppColors.green,
      this.inactiveColor = AppColors.grey1});

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> with SingleTickerProviderStateMixin {
  Animation? circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 60));
    circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
    _animationController!.addStatusListener((status) {
      if (widget.value == false && _animationController!.isCompleted) {
        _animationController!.reverse();
      } else {
        _animationController!.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: SizedBox(
            height: 25,
            width: 50,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: widget.value
                            ? widget.activeColor!
                            : widget.inactiveColor!,
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 3)
                        ]),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2.0, left: 2.0),
                    child: Container(
                      alignment: widget.value
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
