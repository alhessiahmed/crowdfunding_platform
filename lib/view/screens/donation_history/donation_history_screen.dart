import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/text_styles_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/index.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/donation_history/donation_history_controller.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DonationHistoryScreen extends GetView<DonationHistoryController> {
  const DonationHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () => CustomScrollView(
              slivers: [
                _buildHeader(context),

                if (controller.donations.isEmpty)
                  SliverFillRemaining(child: _buildEmptyState(context))
                else ...[
                  _buildDonationsList(),
                  // أضفنا الزر هنا ليكون جزءاً من القائمة ويظهر بعدها بـ 16 بكسل
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12.w, right: 12.w),
                      child: _buildBottomButton(), // محتوى الزر
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // الجزء العلوي الذي يحتوي على العنوان وعدد الحملات المدعومة
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
                    "donation_history".tr,
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
              'donation_history_description'.tr,
              textAlign: TextAlign.center,
              style: TextStylesManager.subTitle.copyWith(fontSize: 12.sp),
            ),

            SizedBox(height: 32.h),

            _buildSummaryCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      height: 76.h,
      width: 345.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? ColorsManager.bgGoogle : Colors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: Image.asset(
              controller.streamlineImage,
              width: 44.w,
              height: 44.w,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            'supported_campaigns'.trParams({
              'count': controller.donations.length.toString(),
            }),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // تصميم الحالة الفارغة (الصورة الأولى)
  Widget _buildEmptyState(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 185.w,
              height: 185.w,
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
            ),
            Icon(
              Icons.star_rounded,
              size: 80.sp,
              color: ColorsManager.primaryCTA,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text(
          'no_donations_yet'.tr,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 32.h),
        Text(
          'start_campaign'.tr,
          style: TextStylesManager.subTitle.copyWith(fontSize: 12.sp),
        ),
        _buildBottomButton(),
      ],
    );
  }

  // تصميم القائمة (الصورة الثانية)
  Widget _buildDonationsList() {
    return SliverMainAxisGroup(
      // تجميع النص مع القائمة
      slivers: [
        // 1. النص الذي يظهر قبل العناصر
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 16.h,
              top: 16.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Text(
              'donation_list'.tr,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode
                    ? Colors.white
                    : ColorsManager.primaryLight,
              ),
            ),
          ),
        ),

        // 2. العناصر نفسها
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _buildDonationItem(controller.donations[index]);
          }, childCount: controller.donations.length),
        ),
      ],
    );
  }

  Widget _buildDonationItem(DonationSummary donation) {
    return Container(
      margin: EdgeInsets.only(left: 16.h, right: 16.h),
      padding: EdgeInsets.all(12.w),
      height: 120.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),

        color: Get.isDarkMode ? ColorsManager.bgGoogle : Colors.white,
      ),
      child: Row(
        children: [
          // 1. الصورة
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              donation.campaignImage,
              width: 91.w,
              height: 67.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),

          // 2. محتوى البيانات
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- السطر الأول: العنوان والنجوم ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        donation.title.tr,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode
                              ? ColorsManager.primaryDark
                              : ColorsManager.primaryLight,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Row(
                      children: [
                        Text(
                          "${donation.numberStars}".tr,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode
                                ? ColorsManager.primaryDark
                                : ColorsManager.primaryLight,
                          ),
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Get.isDarkMode
                              ? ColorsManager.primaryDark
                              : ColorsManager.primaryLight,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                // --- السطر الأخير (المعدل): التاريخ أولاً ثم الزر ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // التاريخ (الآن في جهة اليمين/البداية)
                    Text(
                      controller.formatTimeAgo(donation.donationDate!).tr,
                      style: TextStyle(
                        color: Get.isDarkMode
                            ? ColorsManager.secondaryDark
                            : ColorsManager.secondaryLight,
                        fontSize: 12.sp,
                      ),
                    ),

                    // الزر (الآن في جهة اليسار/النهاية)
                    InkWell(
                      onTap: () {
                        print("تم الضغط على عرض الحملة");
                        // أضف الكود الخاص بالانتقال للحملة هنا
                      },
                      borderRadius: BorderRadius.circular(
                        8.r,
                      ), // مهم جداً ليكون تأثير الضغط متناسق مع حواف الزر
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryCTA,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize
                              .min, // مهم لكي لا يأخذ الزر عرض الشاشة بالكامل
                          children: [
                            Text(
                              'view_campaign'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Image.asset(
                              ImagesManager.viewCampArrow,
                              width: 16.w,
                              height: 16.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.primaryCTA,
          minimumSize: Size(double.infinity, 50.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        onPressed: () {Get.toNamed(RoutesManager.mainScreen);},
        icon: Image.asset(ImagesManager.discoverButton),
        label: Text(
          'explore_campaigns'.tr,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
