import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart'
    show ColorsManager;
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/index.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campagin_details_controller.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_details_widget/donation_button.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupToDonate extends StatelessWidget {
  const PopupToDonate({super.key});

  void openBottomSheet(BuildContext context) {
    Get.bottomSheet(
      GetBuilder<CampaignDetailsController>(
        init: CampaignDetailsController(),
        builder: (controller) {
          return Container(
            height: 480.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? ColorsManager.darkBg
                  : ColorsManager.lightBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12.h),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorsManager.dividerColorDark
                            : ColorsManager.grey2,
                        borderRadius: BorderRadius.all(Radius.circular(100.r)),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'how_many_stars'.tr,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    SizedBox(height: 30.h),
                    DonateStarRow(controller: controller),
                    SizedBox(height: 8.h),
                    TextFieldWidget(
                      controller: controller.customStarsController,
                      hintText: "رقم اخر ...",
                      label: '',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      prefixIcon: SvgPicture.asset(
                        ImagesManager.magicPin,
                        colorFilter: ColorFilter.mode(
                          Get.isDarkMode
                              ? ColorsManager.iconDefaultDark
                              : ColorsManager.iconDefaultLight,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorsManager.bgGoogle
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 2.w),
                          SvgPicture.asset(
                            ImagesManager.lampCharge,
                            colorFilter: ColorFilter.mode(
                              Get.isDarkMode
                                  ? ColorsManager.primaryCTA
                                  : ColorsManager.iconDefaultLight,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            'تبرعك ب50 نجمة = توفر مياه نقية لعائلة لمدة أسبوع',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Get.isDarkMode
                                      ? ColorsManager.white
                                      : Colors.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        final manualText =
                            controller.customStarsController.text.trim();
                        final manualValue = int.tryParse(manualText);
                        final selectedStars =
                            (manualValue != null && manualValue > 0)
                                ? manualValue
                                : controller.selectedStars;
                        Get.toNamed(
                          RoutesManager.paymentScreen,
                          arguments: selectedStars,
                        );
                      },
                      child: Text('Payment_tracking'.tr),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'safe_and secure_donation'.tr,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Get.isDarkMode
                                ? ColorsManager.primaryDark
                                : ColorsManager.primaryLight,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DonateButton(onPressed: () => openBottomSheet(context));
  }
}

class DonateStarRow extends StatelessWidget {
  const DonateStarRow({super.key, required this.controller});
  final CampaignDetailsController controller;
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
