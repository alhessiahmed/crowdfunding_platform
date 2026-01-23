import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:crowdfunding_platform/model/filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.filters,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<FilterItem> filters;
  final int selectedIndex;
  final Function(int index) onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 6.w),
        itemBuilder: (context, index) {
          final item = filters[index];
          final isSelected = selectedIndex == index;

          return ChoiceChip(
                        padding: EdgeInsets.symmetric(vertical: 0.h),
           
            showCheckmark: false,
            selected: isSelected,
            onSelected: (_) => onSelect(index),
            
            labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: isSelected
                  ? ColorsManager.white
                  : Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            shape: RoundedRectangleBorder(
              side: isSelected
                  ? BorderSide.none
                  : BorderSide(color: ColorsManager.primaryLight),
              borderRadius: BorderRadius.circular(48.r),
            ),
            backgroundColor: Get.isDarkMode
                ? ColorsManager.dividerColorDark
                : ColorsManager.dividerColorLight,
            selectedColor: ColorsManager.primaryCTA,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(item.title),
                SizedBox(width: 2.w),
                Container(
                  height: 22,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white54
                        : Get.isDarkMode
                        ? ColorsManager.iconDefaultDark
                        : ColorsManager.iconDefaultLight,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    item.count.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: isSelected ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
