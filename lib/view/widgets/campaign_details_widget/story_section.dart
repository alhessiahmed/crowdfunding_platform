import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:get/get.dart';
class StorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // final cardColor = Get.isDarkMode
    //     ? ColorsManager.bgGoogle
    //     : ColorsManager.white;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        //color: cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تعاني العديد من الأسر من صعوبة الوصول إلى مياه نظيفة وآمنة، مما يعرّض صحتهم وحياتهم اليومية للخطر. من خلال هذه الحملة، نعمل على توفير مصادر مياه آمنة تساعد العائلات على تلبية احتياجاتهم الأساسية بكرامة وأمان.',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: isDark
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 160.h,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 0),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),

              child: Image.asset(
                ImagesManager.test,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.h),

          Text(
            'الأمر لا يتعلق فقط بالماء؛ بل يتعلق بمنحهم الحق في الحياة. كن سبباً في ري عطشهم اليوم.',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: isDark
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
