import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode
          ? ColorsManager.scaffoldBgDark
          : ColorsManager.scaffoldBgLight,
      body: SafeArea(
        child: Column(
          children: [
            _Header(context),
            _Filters(controller.filtersMock),
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
              SizedBox(height: 80.h),
              Stack(
                children: [
       Container(
  height: 224.h,
  width: 345.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(16.r),
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 2,
        offset: Offset(0, 0),
      ),
    );
  }

  Widget _Header(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'every_star_makes_a_difference'.tr,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          GestureDetector(
            onTap: () {
              // handle search tap
            },
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.onSurface,
              radius: 22.r,
              child: SvgPicture.asset(
                ImagesManager.search,
                fit: BoxFit.scaleDown,
                color: Get.isDarkMode
                    ? ColorsManager.primaryLight
                    : ColorsManager.primaryDark,
              ),
            ),
          ),
        ],
      ),

      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 1.3,
              colors: [
                 ColorsManager.iconDefaultLight.withOpacity(0.7),
                 Color(0xFF8A97A8).withOpacity(.9), 
                
              ],
              stops: const [1.0, 1.0],
            ),
          ),
        ),
      ),
    );
  }

  Widget _CampaignsList(
    BuildContext context,
    List<CampaignMock> campaignsMock,
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
                       
                        SizedBox(height: 14.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
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
                ],
              ),
              SizedBox(height: 14.h),

              Text(
                'لا يمكنك إنشاء حملة بعد',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 12.h),

              Text(
                textAlign: TextAlign.center,
                'يتطلّب إنشاء الحملات حسابًا موثّقًا لضمان الموثوقية وحماية المتبرعين.',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontSize: 11.sp),
              ),
              SizedBox(height: 16.h),

              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'ابدأ توثيق الحساب',
                  style: TextStyle(color: Colors.white),
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
                child: Row(
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

          SizedBox(width: 12.w),

          ///  Notification button
          IconWithBackground(
            icon: ImagesManager.notification,
            lightColor: ColorsManager.dividerColorLight,
            darkColor: ColorsManager.dividerColorDark,
            withShadow: true,
          ),
        ],
      ),
    );
  }
}
