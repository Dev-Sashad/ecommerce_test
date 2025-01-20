import 'package:flutter/material.dart';

abstract class AppColors {

  static const Color primaryColor = Color(0xFF02933C);
  static const Color secondaryColor = Color(0xFF088158);
  static const Color backgroundColor = Color(0xffFFFFFF);
  static const Color backgroundGreyColor = Color(0xFFF1EEEE);
  static const Color backgroundGrey2Color = Color(0xFFB6B6B6);
  static const Color black = Color(0xFF000000);

  static const Color grey1 = Color(0xFF808D9E);
  static const Color grey2 = Color(0xFFF5F5F5);
  static const Color darkGrey = Color(0xFF585757);
  static const Color borderGrey = Color(0xFFEAEAEA);
  static const Color borderGrey1 = Color(0xFFD9D9D9);
  static const Color borderGrey2 = Color(0xFFE9ECF2);
  

  // light Grey
  static const Color lightGrey = Color(0xFFE8E8E8);
  static const Color lightGrey1 = Color(0xFFF9FAFB);

  // Text Colors
  static const Color textBlack = Color(0xFF313131);
  static const Color textGrey = Color(0xFF807C7C);
  static const Color textGrey2 = Color(0xFF757D8A);
  
  // others
  static const Color blue =  Color(0xFF2BBDEB);
  static const Color yellow =  Color(0xFFFBBE21);
  static const Color orange =  Color(0xFFFA6D4E);
  static const Color brown =  Color(0xFF834813);
  static const Color green = Color(0xFF027A48);
  static const Color purple = Color(0xFF605CF3);
  static const Color red = Color(0xFFB42318);
  static const Color buttonDisabled = Color(0xFFAAAAAA);
  static const Color error = Color(0xFF8C0900);
  static const Color successGreen = Color(0xFF0C7731);
  static const Color transparentBlack = Color(0x99000000);
  static const Color warning = Color(0xFF754E00);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF8E8E8E);
 
  //Green
  static Color lightErrorBorderColor = HexColor.fromHex("#F4B0A1");
  static Color lightErrorColor = HexColor.fromHex("#FFF5F3");
  static Color toastTextColor = HexColor.fromHex("#2F3F53");
  static Color lightSuccessBorderColor = HexColor.fromHex("#48C1B5");
  static Color lightSuccessColor = HexColor.fromHex("#F6FFF9");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
