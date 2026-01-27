import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/text_styles_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/notifications/notification_controller.dart';
import 'package:crowdfunding_platform/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationsScreen extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => CustomScrollView(
            slivers: [
              _buildHeader(context),
              if (controller.notifications.isEmpty)
                SliverFillRemaining(child: _buildEmptyState())
              else ...[
                _buildSectionTitle(
                  "new_label".tr,
                  count: controller.notifications.where((n) => n.isNew).length,
                ), // "الجديدة"
                _buildNotificationsList(true),

                _buildSectionTitle("yesterday_label".tr), // "الأمس"
                _buildNotificationsList(false),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // الجزء العلوي (العنوان + زر تحديد كمقروء)
  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          // هذه الخاصية ستجعل كل محتويات العمود تبدأ من "البداية"
          // وفي حالة التطبيقات العربية (RTL) البداية هي اليمين.
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // زر الرجوع
                InkWell(
                  child: Image.asset(ImagesManager.back),
                  onTap: () => Get.back(),
                ),

                // العنوان
                Text(
                  "notifications_title".tr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                ),

                // زر تحديد كمقروء
                TextButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    ImagesManager.check,
                    height: 24.sp,
                    width: 24.sp,
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
                  label: Text(
                    "mark_all_read".tr,
                    style: TextStylesManager.subTitle.copyWith(
                      fontSize: 12.sp,
                      color: Get.isDarkMode
                          ? ColorsManager.secondaryDark
                          : ColorsManager.secondaryLight,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Text(
              "notifications_subtitle".tr,
              style: TextStylesManager.subTitle.copyWith(
                fontSize: 12.sp,
                color: Get.isDarkMode
                    ? ColorsManager.secondaryDark
                    : ColorsManager.secondaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // الحالة الفارغة (الصورة الثالثة)
  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(40.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Get.isDarkMode
                ? ColorsManager.bgSectionDark
                : ColorsManager.bgSectionLight,
            boxShadow: [
              BoxShadow(
                color: Get.isDarkMode
                    ? ColorsManager.primaryCTA
                    : ColorsManager.primaryCTA,
                blurRadius: 100,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Image.asset(
            controller.notificationImage,
            height: 99.sp,
            width: 100.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "no_notifications_yet".tr,
          style: TextStylesManager.title.copyWith(
            fontSize: 24.sp,
            color: Get.isDarkMode
                ? ColorsManager.primaryDark
                : ColorsManager.primaryLight,
          ),
        ),
      ],
    );
  }

  // تصميم كرت الإشعار (الصورة الرابعة)
  Widget _buildNotificationItem(NotificationModel item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? ColorsManager.bgGoogle : Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Get.isDarkMode
              ? ColorsManager.bgSectionDark
              : ColorsManager.bgSectionLight,
        ),
        boxShadow: item.isNew
            ? [BoxShadow(color: Colors.blue.withOpacity(0.05), blurRadius: 4)]
            : [],
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // لضمان محاذاة الأيقونة مع أعلى النص
        children: [
          // 1. الأيقونة
          CircleAvatar(
            radius: 20.r,
            backgroundColor: Get.isDarkMode
                ? ColorsManager.bgSectionDark
                : ColorsManager.bgSectionLight,
            child: Icon(
              item.icon,
              size: 20.sp,
              color: Get.isDarkMode
                  ? ColorsManager.primaryDark
                  : ColorsManager.primaryLight,
            ),
          ),

          SizedBox(width: 10.w),

          // 2. محتوى النصوص والوقت
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // سطر العنوان والوقت معاً
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: Get.isDarkMode
                              ? ColorsManager.primaryDark
                              : ColorsManager.primaryLight,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    // الوقت أصبح هنا بجانب العنوان
                    Text(
                      controller.formatNotificationTime(item.time),
                      style: TextStyle(
                        fontSize: 8.sp,
                        color: Get.isDarkMode
                            ? ColorsManager.secondaryDark
                            : ColorsManager.secondaryLight,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                // الوصف تحت العنوان والوقت
                Text(
                  item.body,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ويدجت مساعدة لعرض العناوين الجانبية (الجديدة، الأمس)
  Widget _buildSectionTitle(String title, {int? count}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            // عنوان القسم (مثلاً: الجديدة)
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.sp,
                color: Get.isDarkMode
                    ? ColorsManager.primaryDark
                    : ColorsManager.primaryLight,
              ),
            ),

            // --- هاد هو التعديل السحري ---
            const Spacer(),

            // إذا كان هناك عدد، سيظهر في أقصى اليسار
            if (count != null && count > 0)
              Container(
                padding: EdgeInsets.all(
                  8.w,
                ), // زيادة الحشو قليلاً ليظهر بشكل دائري أفضل
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? ColorsManager.bgSectionDark
                      : ColorsManager.bgSectionLight,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "$count",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationsList(bool isNewSection) {
    final filteredList = controller.notifications
        .where((n) => n.isNew == isNewSection)
        .toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => _buildNotificationItem(filteredList[index]),
        childCount: filteredList.length,
      ),
    );
  }
}
