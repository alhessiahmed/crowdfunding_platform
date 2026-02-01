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
import 'package:get/get.dart';

class PopupToDonate extends GetView<CampaignDetailsController> {
  const PopupToDonate({super.key});

  void openBottomSheet(BuildContext context) {
    final wasRegistered = Get.isRegistered<CampaignDetailsController>();
    if (!wasRegistered) {
      Get.put(CampaignDetailsController());
    }

    Get.bottomSheet(
      Container(
        height: 480.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? ColorsManager.darkBg : ColorsManager.lightBg,
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
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 30.h),
                DonateStarRow(),
                SizedBox(height: 8.h),

                TextFieldWidget(
                  controller: controller.controller!,
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
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                    final manualText =
                        controller.controller?.text.trim() ?? '';
                    final manualValue = int.tryParse(manualText);
                    final selectedStars =
                        (manualValue != null && manualValue > 0)
                            ? manualValue
                            : controller.stars[controller.selectedIndex.value];
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
      ),
    ).whenComplete(() {
      if (!wasRegistered) {
        Get.delete<CampaignDetailsController>();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DonateButton(onPressed:  () => openBottomSheet(context));
  }
}

class DonateStarRow extends GetView<CampaignDetailsController> {
  const DonateStarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.stars.length, (index) {
          final isSelected = controller.selectedIndex.value == index;
          final unselectedBg = Get.isDarkMode
              ? ColorsManager.bgSectionDark
              : Colors.white;
          final unselectedBorder = Get.isDarkMode
              ? ColorsManager.dividerColorDark
              : ColorsManager.grey2;
          final unselectedTextColor = Get.isDarkMode
              ? ColorsManager.primaryDark
              : ColorsManager.primaryLight;
          final selectedTextColor = Colors.white;
          return InkWell(
            onTap: (){ 
              controller.selectStarIndex(index);
            },
            child: Container(
              margin: EdgeInsets.only(left: 2.w),
              padding: EdgeInsets.all(isSelected ? 1.w : 0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? ColorsManager.primaryCTA : unselectedBorder,
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Container(
                height: 68.h,
                width: 83.w,
                //padding: EdgeInsets.symmetric( vertical: 12.w , horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: isSelected ? ColorsManager.primaryCTA : unselectedBg,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 3.w,
                  children: [
                    Text(
                      controller.stars[index].toString(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isSelected
                            ? selectedTextColor
                            : unselectedTextColor,
                      ),
                    ),
                    SvgPicture.asset(
                      ImagesManager.star,
                      colorFilter: ColorFilter.mode(
                        isSelected ? selectedTextColor : unselectedTextColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
