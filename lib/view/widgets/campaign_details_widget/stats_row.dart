import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StatusRow extends StatelessWidget {
   StatusRow({super.key , this.donoorsNo , this.goalsStarNo , required this.remaiaingDats});
String? goalsStarNo ; 
String? donoorsNo ;
String  remaiaingDats ;



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:  [
        _StatItem(
          value: goalsStarNo ?? '0',
          label: 'النجوم المستهدفة',
          icon: ImagesManager.cup,
        ),
        _StatItem(
          value: donoorsNo ?? '0',
          label: 'عدد الداعمين',
          icon: ImagesManager.profile2user,
        ),
        _StatItem(value: calculateRemainingDays(remaiaingDats).toString() ?? 'unKnown', label: 'الايام المتبقية', icon: ImagesManager.calender2),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? ColorsManager.bgGoogle : ColorsManager.white;
    return Container(
    width: 104.w,
      //height: 127.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 4.r,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? ColorsManager.dividerColorDark
                  : ColorsManager.dividerColorLight,
              //borderRadius: BorderRadius.circular(14.r),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              color: Get.isDarkMode
                  ? ColorsManager.iconDefaultDark
                  : ColorsManager.iconDefaultLight,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.sp,
              color: ColorsManager.primaryCTA,
            ),
          ),
          // SizedBox(height: 2.h),
          Text(
            textAlign: TextAlign.center,
            label,
            style: TextStyle(
              fontSize: 8.sp,
              color: Get.isDarkMode
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
int calculateRemainingDays(String endDate) {
  final end = DateTime.parse(endDate).toLocal();
  final now = DateTime.now();

  final difference = end.difference(now).inDays;

  return difference > 0 ? difference : 0;
}