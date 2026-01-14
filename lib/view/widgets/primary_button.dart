import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controller/core/constants/colors_manager.dart';

class PrimaryButton {
  PrimaryButton._();

  static final ElevatedButtonThemeData elevated = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 56.h),
      backgroundColor: ColorsManager.primaryCTA,
      foregroundColor: ColorsManager.primaryTextLight,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      textStyle: TextStyle(
        fontFamily: 'Almarai',
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
  );
}
