import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/text_styles_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/notifications/notification_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationSettingsScreen
    extends GetView<NotificationSettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode
          ? ColorsManager.scaffoldBgDark
          : ColorsManager.scaffoldBgLight,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildHeader(context), // نفس الهيدر اللي عملناه مع زر الرجوع
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildSectionTitle('impact_notification'.tr),
                  _buildSettingsGroup([
                    _buildSwitchTile(
                      title: 'donation_updates'.tr,
                      subtitle: 'donation_updates_desc'.tr,
                      value: controller.isImpactUpdatesEnabled,
                    ),
                    _buildSwitchTile(
                      title: 'campaign_progress'.tr,
                      subtitle: 'campaign_progress_desc'.tr,
                      value: controller.isCampaignProgressEnabled,
                    ),
                  ]),

                  _buildSectionTitle('contribution_notification'.tr),
                  _buildSettingsGroup([
                    _buildSwitchTile(
                      title: 'new_campaigns_interests'.tr,
                      subtitle: 'new_campaigns_interests_desc'.tr,
                      value: controller.isNewCampaignsEnabled,
                    ),
                    _buildSwitchTile(
                      title: 'closing_campaigns'.tr,
                      subtitle: 'closing_campaigns_desc'.tr,
                      value: controller.isClosingCampaignsEnabled,
                    ),
                  ]),

                  _buildSectionTitle('security_notifications'.tr),
                  _buildSettingsGroup([
                    _buildSwitchTile(
                      title: 'account_security_alerts'.tr,
                      subtitle: 'account_security_alerts_desc'.tr,
                      value: controller.isSecurityAlertsEnabled,
                    ),
                    _buildSwitchTile(
                      title: 'account_updates'.tr,
                      subtitle: 'accouunt_updates_desc'.tr,
                      value: controller.isAccountUpdatesEnabled,
                    ),
                  ]),
                  SizedBox(height: 40.h),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت لتجميع الخيارات في بطاقة رمادية واحدة كما في الصورة
  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? ColorsManager.bgSectionDark
            : ColorsManager.bgSectionLight,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(children: children),
    );
  }

  // ويدجت الخيار الواحد (Switch Tile)
  Widget _buildSwitchTile({
    required String title,
    required String subtitle,
    required RxBool value,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundColor: Colors.blue.withOpacity(0.05),
            child: Image.asset(
              Get.isDarkMode
                  ? ImagesManager.notificationDark
                  : ImagesManager.notificationLight,
              height: 24,
              width: 24,
            ),
          ),

          SizedBox(width: 10.w),

          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: Get.isDarkMode
                        ? ColorsManager.primaryDark
                        : ColorsManager.primaryLight,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
                ),
              ],
            ),
          ),

          Obx(
            () => Switch(
              value: value.value,
              onChanged: (val) => value.value = val,
              activeTrackColor: ColorsManager.primaryCTA,
              inactiveTrackColor: Get.isDarkMode
                  ? ColorsManager.dividerColorDark
                  : ColorsManager.dividerColorLight,
              inactiveThumbColor: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: Get.isDarkMode
              ? ColorsManager.primaryDark
              : ColorsManager.primaryLight,
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            // السطر العلوي: يحتوي على زر الرجوع والعنوان
            Row(
              children: [
                // 1. زر الرجوع (Image.asset)
                InkWell(
                  onTap: () => Get.back(), // أو Navigator.pop(context)
                  child: Image.asset(
                    ImagesManager.back, // تأكد من المسار الصحيح
                    width: 44.w,
                    height: 44.w,
                  ),
                ),

                // 2. العنوان (في المنتصف)
                Expanded(
                  child: Text(
                    'notification_settings'.tr,
                    textAlign: TextAlign.center, // عشان يضل بالوسط بالظبط
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // 3. مساحة وهمية (SizedBox) بنفس حجم زر الرجوع
                // عشان نضمن إن العنوان يضل بالوسط الحقيقي مش "متزحزح" لليسار
                SizedBox(width: 24.w),
              ],
            ),

            SizedBox(height: 10.h),

            Text(
              'notification_settings_subtitle'.tr,
              textAlign: TextAlign.center,
              style: TextStylesManager.subTitle.copyWith(fontSize: 12.sp),
            ),

            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
