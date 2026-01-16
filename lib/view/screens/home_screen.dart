import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/home_controller.dart';
import 'package:crowdfunding_platform/view/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
            SizedBox(height: 10.h),
            Expanded(child: _CampaignsList(context, controller.campaignsMock)),
          ],
        ),
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
                color: 
                 Get.isDarkMode
                    ? ColorsManager.primaryLight
                    : ColorsManager.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Filters(List<FilterItem> filters) {
    return SizedBox(
      height: 34.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (context, index) {
          final item = filters[index];
          final isSelected = index == 0;

          return ChoiceChip(
            // showCheckmark: false,
            selected: isSelected,
            labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: isSelected
                  ? ColorsManager.white
                  : Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            showCheckmark: false,
            onSelected: (bool value) {},
            padding: EdgeInsets.symmetric(vertical: 0.h),
            shape: RoundedRectangleBorder(
              side: !isSelected
                  ? BorderSide(color: ColorsManager.primaryLight)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(48.r),
            ),
            backgroundColor: Get.isDarkMode
                ? ColorsManager.dividerColorDark
                : ColorsManager.dividerColorLight,
            selectedColor: ColorsManager.primaryCTA,
            disabledColor: Get.isDarkMode
                ? ColorsManager.dividerColorDark
                : ColorsManager.dividerColorLight,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.title,
                  // style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //       color: Get.isDarkMode ?ColorsManager.primaryTextDark : ColorsManager.primaryLight.withOpacity(.9)

                  //     ),
                ),
                SizedBox(width: 8.w),
                Container(
                  height: 22,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                      color: isSelected
                          ? Colors.black
                          : Theme.of(context).colorScheme.onPrimary,
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

  Widget _CampaignsList(
    BuildContext context,
    List<CampaignMock> campaignsMock,
  ) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 16.w ,right: 16.w , bottom: 130.h ),
      itemCount: campaignsMock.length,
      itemBuilder: (_, index) {
        final campain = campaignsMock[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 10.h , top:10),
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
                    color:Get.isDarkMode
                ? ColorsManager.white
                : ColorsManager.primaryLight, 
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  campain.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                    Get.isDarkMode
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
                        Text('${campain.raised} نجمة'  , style: TextStyle( 
                        color:  Get.isDarkMode
                ? ColorsManager.primaryTextLight
                : ColorsManager.primaryLight,
                        ),),
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
    final progress =
        (campain.raised / campain.target).clamp(0.0, 1.0);

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
        color: Get.isDarkMode ? ColorsManager.dividerColorDark: ColorsManager.dividerColorLight,
        borderRadius: BorderRadius.circular(12.r),
      ),),
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
                          foregroundColor: Get.isDarkMode ? ColorsManager.white : ColorsManager.primaryLight ,
                          backgroundColor: Get.isDarkMode ?ColorsManager.bgGoogle :ColorsManager.white
                          , side: BorderSide(color: Get.isDarkMode ?ColorsManager.iconDefaultLight :ColorsManager.primaryLight), 
                        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.r),
    ),
                        ),
                        onPressed: () {},
                        child: Text( 'مشاهدة التفاصيل'),
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
                        ),),
                        onPressed: () {},
                        child: Text( 'تبرع فورًا'),
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
