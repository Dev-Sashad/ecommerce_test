import 'package:ecommerce_test/utils/enums.dart';
import 'package:ecommerce_test/utils/locator.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.height,
    this.maxLines,
    this.textType = TextType.smallText,
    this.lineSpacing,
    this.fontWeight,
    this.fontSize,
    this.letterspacing,
    this.textDecoration,
    this.textStyle,
    this.fontStyle,
    this.decorationColor
  });

  final String text;
  final Color? color;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextType? textType;
  final FontWeight? fontWeight;
  final double? lineSpacing;
  final double? fontSize;
  final double? letterspacing;
  final TextDecoration? textDecoration;
  final TextStyle? textStyle;
  final FontStyle? fontStyle;
  final Color? decorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 50,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
       style: textStyle ??
          setTextStyle.copyWith(
              fontSize: fontSize,
              color: color,
              fontStyle: fontStyle,
              fontWeight: fontWeight,
              decoration: textDecoration,
              decorationColor: decorationColor),
    );
  }


   TextStyle get setTextStyle  {
    final ctx = navigationService.navigationKey.currentState!.context;
    switch (textType) {
      case TextType.headerText:
        return Theme.of(ctx).textTheme.headlineLarge!;

      case TextType.largeText:
        return Theme.of(ctx).textTheme.titleLarge!;

      case TextType.mediumText:
        return Theme.of(ctx).textTheme.bodyLarge!;

      case TextType.smallText:
        return Theme.of(ctx).textTheme.bodyMedium!;

      case TextType.tinyText:
        return Theme.of(ctx).textTheme.bodySmall!;

      default:
        return Theme.of(ctx).textTheme.bodySmall!;
    }
  }
}
