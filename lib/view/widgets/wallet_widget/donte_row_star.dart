import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/wallet/request_to_withdraw_profits_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DonateStarRow extends GetView<RequestToWithdrawProfitsController> {
  const DonateStarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller.customStarsController,
          builder: (context, value, _) {
            final isRowDisabled = value.text.trim().isNotEmpty;

            return Obx(() {
              final count = controller.stars.length;
              if (count == 0) {
                return const SizedBox.shrink();
              }
              final selectedIndex = controller.selectedIndex.value;

              final maxWidth = constraints.maxWidth.isFinite
                  ? constraints.maxWidth
                  : MediaQuery.sizeOf(context).width;
              final itemSpacing = 4.w;
              final maxItemWidth = 83.w;
              final neededWidth =
                  (maxItemWidth * count) + itemSpacing * (count - 1);
              final shouldWrap = maxWidth < neededWidth;

              Widget buildItem(int index, double width) {
                final isSelected = !isRowDisabled && selectedIndex == index;
                final unselectedBg = Get.isDarkMode
                    ? ColorsManager.bgSectionDark
                    : Colors.white;
                final unselectedBorder = ColorsManager.white;
                final unselectedTextColor = Get.isDarkMode
                    ? ColorsManager.primaryDark
                    : ColorsManager.primaryLight;
                final selectedTextColor = Theme.of(context).colorScheme.primary;
                final disabledColor = Theme.of(context).colorScheme.outline;

                final itemPadding = 1.w;
                final borderColor = isRowDisabled
                    ? disabledColor
                    : (isSelected
                          ? ColorsManager.primaryCTA
                          : unselectedBorder);
                final borderWidth = isSelected ? 2.0 : 1.0;
                final fillColor = isRowDisabled
                    ? unselectedBg
                    : (isSelected ? ColorsManager.primaryCTA : unselectedBg);
                final contentColor = isRowDisabled
                    ? disabledColor
                    : (isSelected ? selectedTextColor : unselectedTextColor);

                return SizedBox(
                  width: width,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: isRowDisabled
                        ? null
                        : () {
                            controller.selectStarIndex(index);
                          },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOutCubic,
                      padding: EdgeInsets.all(itemPadding),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: borderColor,
                          width: borderWidth,
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOutCubic,
                        height: 68.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: fillColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 3.w,
                          children: [
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 220),
                              curve: Curves.easeOutCubic,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: contentColor,
                                  ),
                              child: Text(controller.stars[index].toString()),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 220),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeOutCubic,
                              transitionBuilder: (child, animation) =>
                                  FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  ),
                              child: SvgPicture.asset(
                                ImagesManager.star,
                                key: ValueKey<bool>(isSelected),
                                colorFilter: ColorFilter.mode(
                                  contentColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }

              if (shouldWrap) {
                final perRow =
                    ((maxWidth + itemSpacing) / (maxItemWidth + itemSpacing))
                        .floor()
                        .clamp(1, count);
                final rowItemWidth =
                    ((maxWidth - itemSpacing * (perRow - 1)) / perRow)
                        .clamp(0.0, maxItemWidth)
                        .toDouble();

                return Wrap(
                  alignment: WrapAlignment.center,
                  spacing: itemSpacing,
                  runSpacing: itemSpacing,
                  children: List.generate(
                    count,
                    (index) => buildItem(index, rowItemWidth),
                  ),
                );
              }

              final rowItemWidth =
                  ((maxWidth - itemSpacing * (count - 1)) / count)
                      .clamp(0.0, maxItemWidth)
                      .toDouble();
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var index = 0; index < count; index++) ...[
                    buildItem(index, rowItemWidth),
                    if (index != count - 1) SizedBox(width: itemSpacing),
                  ],
                ],
              );
            });
          },
        );
      },
    );
  }
}
