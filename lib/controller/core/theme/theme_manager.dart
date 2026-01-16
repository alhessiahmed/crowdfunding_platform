import 'package:crowdfunding_platform/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors_manager.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Almarai',
      brightness: Brightness.light,
      textTheme: ThemeData.light().textTheme
          .apply(fontFamily: 'Almarai')
          .copyWith(
            bodyLarge: TextStyle(
              color: ColorsManager.primaryLight,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
              color: ColorsManager.secondaryLight,
              fontSize: 16.sp,
            ),
            bodySmall: TextStyle(
              color: ColorsManager.grey,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
      colorScheme: const ColorScheme.light(
        onSecondaryContainer : ColorsManager.primaryLight, 
        primary: ColorsManager.primaryLight,
        surface: ColorsManager.lightBg,
        onPrimary: Colors.white,
        onSurface: ColorsManager.primaryLight, // for normal text
        onSurfaceVariant: ColorsManager.secondaryLight, // for secondery text
        outline: ColorsManager.outlineBorder, // for disabled text
      ),
      elevatedButtonTheme: PrimaryButton.elevated,
      // scaffoldBackgroundColor: ColorsManager.bgColor,
      // appBarTheme: _appBarTheme(Brightness.light),
      dividerColor: ColorsManager.dividerColorLight,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Almarai',
      brightness: Brightness.dark,
      textTheme: ThemeData.dark().textTheme
          .apply(fontFamily: 'Almarai')
          .copyWith(
            bodyLarge: TextStyle(
              color: ColorsManager.primaryDark,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
              color: ColorsManager.secondaryDark,
              fontSize: 16.sp,
            ),
            bodySmall: TextStyle(color: ColorsManager.grey, fontSize: 12.sp),
          ),
      colorScheme: ColorScheme.dark(
                onSecondaryContainer : ColorsManager.white, 

        primary: ColorsManager.primaryLight,
        surface: ColorsManager.darkBg,
        onPrimary: Colors.white,
        onSurface: Colors.white,
        onSurfaceVariant: ColorsManager.secondaryDark,
      ),
      elevatedButtonTheme: PrimaryButton.elevated,
      // scaffoldBackgroundColor: ColorsManager.darkBg,
      // appBarTheme: _appBarTheme(Brightness.dark),
      dividerColor: ColorsManager.dividerColorDark,
    );
  }

  // static AppBarTheme _appBarTheme(Brightness brightness) {
  //   return AppBarTheme(
  //     centerTitle: true,
  //     elevation: 0,
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: brightness == Brightness.light
  //           ? Brightness.dark
  //           : Brightness.light,
  //     ),
  //   );
  // }
}
