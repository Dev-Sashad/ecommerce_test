import 'package:ecommerce_test/_lib.dart';
import 'package:ecommerce_test/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  /// The app was designed in a light theme mode so, there's no dark theme data
  /// for now
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    dialogTheme: const DialogTheme(
      backgroundColor: Colors.white,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white, // Set your default color here
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedLabelStyle: GoogleFonts.urbanist(
        fontSize: 12.sp,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.urbanist(
        fontSize: 12.sp,
        color: AppColors.grey1,
        fontWeight: FontWeight.w400,
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Color(0xFFFFFFFF),
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFFFFF),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      primaryContainer: AppColors.primaryColor,
      onSurface: AppColors.textGrey,
      onPrimary: AppColors.white,
      surface: AppColors.white, // background color of the date picker
    ),
    primaryColor: AppColors.primaryColor,
    scrollbarTheme: const ScrollbarThemeData().copyWith(
      thumbColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
    highlightColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: AppColors.black),
    fontFamily: GoogleFonts.poppinsTextTheme().bodyLarge!.fontFamily,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 20.sp,
        color: AppColors.textBlack,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: GoogleFonts.poppins(
        fontSize: 20.sp,
        color: AppColors.textBlack,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textBlack,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textBlack,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textBlack,
      ),
    ),
    buttonTheme:
        const ButtonThemeData(buttonColor: AppColors.primaryColor, height: 58),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    ),
  );
}
