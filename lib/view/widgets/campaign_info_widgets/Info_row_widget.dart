import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InfoRowWidget extends StatelessWidget {
  final String text;
  final String? iconPath; // صورة الأيقونة، إذا موجودة
  String get materialImage =>
      Get.isDarkMode ? ImagesManager.materialDark : ImagesManager.materialLight;

  const InfoRowWidget({super.key, required this.text, this.iconPath});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: SizedBox(
              width: 24.w,

              height: 24.w,
              child: Image.asset(materialImage),
            ),
          ),

          SizedBox(width: 4.w),
          Text(
            text,
            textAlign: TextAlign.right,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
