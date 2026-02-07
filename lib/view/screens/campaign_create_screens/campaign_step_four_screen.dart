import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/constants_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/text_styles_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_four_controller.dart';
import 'package:crowdfunding_platform/view/widgets/campaign_info_widgets/custom_step_appBar_widget.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignStepFourScreen extends GetView<CampaignStepFourController> {
  CampaignStepFourScreen({super.key});
  final bool isDark = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: Obx(
            () => CustomStepAppBar(
              currentStep: controller.currentStep.value == 4 ? 4 : 4,
              totalSteps: 4,
              logoPath: ImagesManager.logo,
              progressWidth: 58,
            ),
          ),
        ),
        body: Stack(
          children: [
            Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                children: [
                  Text(
                    'campaign_rev'.tr,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 16.h),

                  Text(
                    'check_details'.tr,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 11),

                  // بطاقة تفاصيل الحملة
                  Container(
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? ColorsManager.bgSectionDark
                          : ColorsManager.bgSectionLight,
                      borderRadius: BorderRadius.circular(20.r),

                      boxShadow: ConstantsManager.boxShadow,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 16.h),
                        _buildImageHeader(),
                        _buildDetailItem(
                          title: "campaign_name".tr,
                          value: "campaign_name_value".tr,
                          iconPath: ImagesManager.educationIcon,
                          context: context,
                          isTitle: true,
                        ),
                        const Divider(
                          height: 1,
                          color: ColorsManager.outlineBorder,
                        ),
                        _buildDetailItem(
                          title: "description".tr,
                          value: "description_value".tr,
                          context: context,
                          isTitle: false,
                        ),
                        const Divider(
                          height: 1,
                          color: ColorsManager.outlineBorder,
                        ),
                        _buildFooterMetrics(),
                      ],
                    ),
                  ),

                  SizedBox(height: 11.h),
                  Text(
                    'continue_process'.tr,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(height: 10),
                  _buildInfoBanner(),
                  _buildCheckbox(),

                  SizedBox(height: 20.h),

                  ElevatedButton(
                    onPressed: controller.goToNextStep,
                    child: Text('send_campaign'.tr),
                  ),

                  SizedBox(height: 12.h),

                  SecondaryButton(
                    label: 'save_campaign'.tr,
                    onPressed: Get.back,
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          child: Image.asset(
            ImagesManager.campaignReview,
            height: 200.h,
            width: 313,
            fit: BoxFit.cover,
          ),
        ),
        // زر التعديل الصغير فوق الصورة
        Positioned(
          top: 10.h,
          right: 70.w,
          child: Container(
            padding: EdgeInsets.all(6.w), // المسافة حول الأيقونة

            child: InkWell(
              child: Image.asset(ImagesManager.editLight),
              onTap: () {
                // هون حط الكود اللي بدك إياه يتنفذ عند الضغط
                print("Edit  pressed");
              },
            ),
          ),
        ),
        // Tag "تعليمي"
        Positioned(
          top: 16.h,
          right: 10.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: ColorsManager.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "تعليمي",
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primaryLight,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem({
    required String title,
    required String value,
    String? iconPath,
    required context,
    bool? isTitle,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.bodySmall),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: isTitle! ? 16 : 12,
                    // إذا كان isTitle صحيح بكون الخط Bold، غير هيك بكون Normal
                    fontWeight: isTitle ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            child: Image.asset(controller.editImage),
            onTap: () {
              // هون حط الكود اللي بدك إياه يتنفذ عند الضغط
              print("Edit $title pressed");
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFooterMetrics() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          _buildSmallMetric("الهدف", "5,000 ", true),
          const Spacer(),
          _buildSmallMetric("المدة", "30 ", false),
        ],
      ),
    );
  }

  Widget _buildSmallMetric(String title, String value, bool isAim) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,

              style: TextStylesManager.subTitle.copyWith(fontSize: 11.sp),
            ),
            Row(
              children: [
                // 2. نص القيمة (الرقم)
                Text(
                  value,
                  style: TextStyle(
                    color: Get.isDarkMode
                        ? ColorsManager.white
                        : ColorsManager.primaryLight,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // 3. إذا كان "المدة" (isAim == false) نضع كلمة "يوم" بعد الرقم
                if (!isAim) ...[
                  SizedBox(width: 4.w),
                  Text(
                    "يوم",
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? ColorsManager.white
                          : ColorsManager.primaryLight,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                if (isAim) ...[
                  Image.asset(
                    Get.isDarkMode
                        ? ImagesManager.staryDark
                        : ImagesManager.staryLight,
                  ),
                  SizedBox(width: 4.w),
                ],
              ],
            ),
          ],
        ),

        SizedBox(width: 60.w),
        InkWell(
          child: Image.asset(controller.editImage),
          onTap: () {
            // هون حط الكود اللي بدك إياه يتنفذ عند الضغط
            print("Edit $title pressed");
          },
        ),
      ],
    );
  }

  Widget _buildInfoBanner() {
    return Container(
      height: 80,
      width: 345,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? ColorsManager.bgSectionDark
            : ColorsManager.bgSectionLight,
        border: Border.all(
          color: isDark
              ? ColorsManager.dividerColorDark
              : ColorsManager.dividerColorLight,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Color(0xFF333333) : Color(0xFFE2E8F0),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),

            child: Image.asset(
              Get.isDarkMode
                  ? ImagesManager.materialDark
                  : ImagesManager.materialLight,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              "alert".tr,
              style: TextStyle(
                fontSize: 11.sp,
                color: Get.isDarkMode
                    ? ColorsManager.white
                    : ColorsManager.primaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckbox() {
    final controller =
        Get.find<CampaignStepFourController>(); // استدعاء الكنترولر

    return InkWell(
      onTap: () => controller.toggleAgreement(), // الضغط على النص يغير الحالة
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h), // زيادة مساحة اللمس
        child: Row(
          children: [
            SizedBox(
              width: 24.w,
              child: Obx(
                () => Checkbox(
                  value: controller
                      .isAgreed
                      .value, // القيمة مرتبطة بالـ Controller
                  activeColor: ColorsManager.primaryCTA,
                  onChanged: (val) => controller.toggleAgreement(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                "confirm".tr,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Get.isDarkMode
                      ? ColorsManager.white
                      : ColorsManager.primaryLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
