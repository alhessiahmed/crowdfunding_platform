import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class DonateButton extends StatelessWidget {
  DonateButton( {super.key ,required this.onPressed,});
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          backgroundColor: ColorsManager.primaryCTA,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تبرع بالنجوم',
              style: TextStyle(
                color: ColorsManager.white,
                fontWeight: FontWeight.w800,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                ImagesManager.star,
                color: ColorsManager.primaryCTA,
              ),
            ),
            //  Icon(Icons.stars , size: 24.r, color: ColorsManager.white,)
          ],
        ),
      ),
    );
  }
}
