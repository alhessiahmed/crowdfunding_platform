import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:crowdfunding_platform/model/campagin_model.dart';
import 'package:crowdfunding_platform/view/widgets/filter_section.dart';
import 'package:crowdfunding_platform/view/widgets/header_with_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DiscoverScreen extends GetView<DiscoverController> {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWithSearch(title: 'every_star_makes_a_difference'.tr),
            Obx(
              () => FilterSection(
                filters: controller.filtersMock,
                selectedIndex: controller.selectedFilterIndex.value,
                onSelect: controller.selectFilter,
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  '${controller.campaignsMock.length} ${'title_campaigns_list'.tr} ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Get.isDarkMode
                        ? ColorsManager.white
                        : ColorsManager.primaryLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(child: CampaignsList(context, controller.campaignsMock)),
          ],
        ),
      ),
    );
  }

  Widget CampaignsList(
    BuildContext context,
    List<campaignModel> campaignsMock,
  ) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 130.h),
      itemCount: campaignsMock.length,
      itemBuilder: (_, index) {
        final campain = campaignsMock[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 10.h, top: 10),
          child: Container(
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? ColorsManager.bgGoogle
                  : ColorsManager.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180.h,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          campain.image,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 18.h,
                        right: 15.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: Get.isDarkMode
                                ? ColorsManager.bgGoogle
                                : ColorsManager.dividerColorLight,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            campain.category,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Get.isDarkMode
                                      ? ColorsManager.white
                                      : ColorsManager.primaryLight,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  campain.title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode
                        ? ColorsManager.white
                        : ColorsManager.primaryLight,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  campain.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 3.w,
                      children: [
                        SvgPicture.asset(ImagesManager.star),
                        Text(
                          '${campain.raised} نجمة',
                          style: TextStyle(
                            color: Get.isDarkMode
                                ? ColorsManager.primaryTextLight
                                : ColorsManager.primaryLight,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "الهدف : ${campain.target} نجمة",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Get.isDarkMode
                            ? ColorsManager.primaryTextLight
                            : ColorsManager.primaryLight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final progress = (campain.raised / campain.target).clamp(
                      0.0,
                      1.0,
                    );

                    return Container(
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: ColorsManager.dividerColorLight,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: Get.isDarkMode
                                  ? ColorsManager.dividerColorDark
                                  : ColorsManager.dividerColorLight,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 900),
                            curve: Curves.easeInOut,
                            width: constraints.maxWidth * progress,
                            decoration: BoxDecoration(
                              color: ColorsManager.primaryCTA,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          minimumSize: Size(152.w, 40.h),
                          foregroundColor: Get.isDarkMode
                              ? ColorsManager.white
                              : ColorsManager.primaryLight,
                          backgroundColor: Get.isDarkMode
                              ? ColorsManager.bgGoogle
                              : ColorsManager.white,
                          side: BorderSide(
                            color: Get.isDarkMode
                                ? ColorsManager.iconDefaultLight
                                : ColorsManager.primaryLight,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed(RoutesManager.campaignDetailsScreen);
                        },
                        child: Text('مشاهدة التفاصيل'),
                      ),
                    ),
                    SizedBox(width: 8.w),

                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          minimumSize: Size(152.w, 40.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('تبرع فورًا'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
