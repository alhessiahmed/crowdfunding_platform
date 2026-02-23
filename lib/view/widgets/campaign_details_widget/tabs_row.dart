import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campagin_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabsRow extends GetView<CampaignDetailsController> {
  const TabsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Get.isDarkMode
        ? ColorsManager.bgSectionDark
        : ColorsManager.bgSectionLight;
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Obx(
        () => Row(
            children: [
              _tabItem(
                label: 'نظرة عامة',
                selected: controller.selectedTabIndex.value == 0,
                onTap: () => controller.onStelectedTap(0),
                context: context,
              ),
          
              _tabItem(
                label: 'التحديثات',
                selected: controller.selectedTabIndex.value == 1,
                onTap: () => controller.onStelectedTap(1),
                context: context,
              ),
          
              // _TabChip(text: 'التعليقات', isSelected: false),
              // _TabChip(text: 'القصة', isSelected: false),
              // _TabChip(text: 'نظرة عامة', isSelected: true),
            ],
          ),
      )
        
      
    );
  }
}

Widget _tabItem({
  required String label,
  required bool selected,
  required VoidCallback onTap,
  required BuildContext context,
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? Get.isDarkMode
                    ? ColorsManager.bgGoogle
                    : Colors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(28),
          boxShadow: selected
              ? [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 1.h),
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: selected
              ? Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16.sp)
              : Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    ),
  );
}

