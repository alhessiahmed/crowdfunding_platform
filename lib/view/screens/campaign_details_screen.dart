import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CampaignDetailsScreen extends StatelessWidget {
  const CampaignDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      extendBody: true,
      backgroundColor: isDark ? ColorsManager.darkBg : ColorsManager.lightBg,
      body: CustomScrollView(
        slivers: [
          _HeaderSliver(),

          const SliverToBoxAdapter(child: _BodyContent()),
          SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
      ),
      bottomSheet: const _DonateButton(),
    );
  }
}

class _HeaderSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 453.h,
      pinned: true,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      clipBehavior: Clip.none,
      actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
      leading: Padding(
        padding: EdgeInsets.only(right: 16.w),
        child: iconWitBackGround(ImagesManager.arrowCircleRight, context),
      ),

      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: iconWitBackGround(ImagesManager.share, context),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              ImagesManager.test,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 334.h,
            ),
            Positioned(
              child: Container(
                height: 334.h,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.black.withOpacity(0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 30.w,
              top: 200.h,
              bottom: 0.h,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10.w,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsManager.primaryCTA,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Text(
                          'الأولوية القصوى',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: Get.isDarkMode
                                ? ColorsManager.white
                                : ColorsManager.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsManager.iconDefaultLight,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: Row(
                          spacing: 3.w,
                          children: [
                            SvgPicture.asset(
                              ImagesManager.location,
                              color: ColorsManager.white,
                            ),
                            Text(
                              'الأولوية القصوى',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                                color: Get.isDarkMode
                                    ? ColorsManager.white
                                    : ColorsManager.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "قطرة حياة:\n مياه نظيفة لأطفال غزة",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              left: 16.w,
              right: 16.w,
              bottom: 20.h,
              child: _TopCampaignCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconWitBackGround(String icon, BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isDark ? ColorsManager.dividerColorDark : ColorsManager.white,
      ),
      child: SvgPicture.asset(
        fit: BoxFit.scaleDown,
        icon,
        color: isDark
            ? ColorsManager.iconDefaultDark
            : ColorsManager.iconDefaultLight,
      ),
    );
  }
}

class _TopCampaignCard extends StatelessWidget {
  const _TopCampaignCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardColor = Get.isDarkMode
        ? ColorsManager.bgGoogle
        : ColorsManager.white;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(30.w),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(32.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(ImagesManager.star, width: 16.w),
                  SizedBox(width: 6.w),
                  Text(
                    '5,000',
                    style: TextStyle(
                      color: ColorsManager.primaryCTA,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'الهدف: 10,000 نجمة',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? ColorsManager.secondaryDark
                          : ColorsManager.primaryLight,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: ColorsManager.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          height: 8.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            color: ColorsManager.white,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 900),
                          curve: Curves.easeInOut,
                          width: constraints.maxWidth * .5,
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

              SizedBox(height: 16.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    ImagesManager.trendUp,

                    color: Get.isDarkMode
                        ? ColorsManager.white
                        : ColorsManager.secondaryLight,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '135 داعمًا حتى الآن (هذا الأسبوع)',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Get.isDarkMode
                          ? ColorsManager.secondaryDark
                          : ColorsManager.primaryLight,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 14.h),
          _StatsRow(),
          SizedBox(height: 18.h),
          _WhyDonateSection(),
          SizedBox(height: 16.h),
          _TabsRow(),
          SizedBox(height: 14.h),
          _StorySection(),
          SizedBox(height: 10.h),
          _CommentSection(),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _StatItem(
          value: '21',
          label: 'أيام الحملة',
          icon: ImagesManager.calender2,
        ),
        _StatItem(
          value: '400',
          label: 'عدد الداعمين',
          icon: ImagesManager.profile2user,
        ),
        _StatItem(value: '10k', label: 'أثر المبادرة', icon: ImagesManager.cup),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? ColorsManager.bgGoogle : ColorsManager.white;
    return Container(
      width: 105.w,
      height: 127.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: Get.isDarkMode
                  ? ColorsManager.dividerColorDark
                  : ColorsManager.dividerColorLight,
              //borderRadius: BorderRadius.circular(14.r),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              icon,
              color: Get.isDarkMode
                  ? ColorsManager.iconDefaultDark
                  : ColorsManager.iconDefaultLight,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
              color: ColorsManager.primaryCTA,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 11.sp,
              color: Get.isDarkMode
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _WhyDonateSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? ColorsManager.bgGoogle
        : ColorsManager.white;
    final checkIcon = Get.isDarkMode
        ? ImagesManager.checkIconDark
        : ImagesManager.checkIconLight;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'لماذا نحتاج دعمك ؟',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: Get.isDarkMode
                  ? ColorsManager.secondaryDark
                  : ColorsManager.primaryLight,
            ),
          ),
          SizedBox(height: 15.h),
          _BulletItem(
            icon: checkIcon,
            text: 'نوفر مياه نظيفة تدعم النمو الصحي للأطفال',
          ),
          _BulletItem(
            icon: checkIcon,
            text: 'نقلل مخاطر الأمراض المرتبطة بتلوث المياه',
          ),
          _BulletItem(
            icon: checkIcon,
            text: 'نعيد الأمل ونحسن الصحة العامة للأسر',
          ),
          _BulletItem(
            icon: checkIcon,
            text: 'نساعد المدارس والمراكز الطبية والمخيمات',
          ),
        ],
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  const _BulletItem({required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            width: 18.w,
            color: Get.isDarkMode
                ? ColorsManager.lightBg
                : ColorsManager.primaryLight,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 12.sp,
                color: Get.isDarkMode
                    ? ColorsManager.secondaryDark
                    : ColorsManager.secondaryLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TabsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? ColorsManager.bgSectionDark
        : ColorsManager.bgSectionLight;
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          _TabChip(text: 'التعليقات', isSelected: false),
          _TabChip(text: 'القصة', isSelected: false),
          _TabChip(text: 'نظرة عامة', isSelected: true),
        ],
      ),
    );
  }
}

class _TabChip extends StatelessWidget {
  const _TabChip({required this.text, required this.isSelected});

  final String text;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: isSelected
              ? Get.isDarkMode
                    ? ColorsManager.bgGoogle
                    : ColorsManager.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected
                ? isDark
                      ? ColorsManager.primaryTextLight
                      : ColorsManager.primaryLight
                : isDark
                ? ColorsManager.white
                : ColorsManager.primaryLight,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

class _StorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final cardColor = Get.isDarkMode
        ? ColorsManager.bgGoogle
        : ColorsManager.white;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        //color: cardColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تعاني العديد من الأسر من صعوبة الوصول إلى مياه نظيفة وآمنة، مما يعرّض صحتهم وحياتهم اليومية للخطر. من خلال هذه الحملة، نعمل على توفير مصادر مياه آمنة تساعد العائلات على تلبية احتياجاتهم الأساسية بكرامة وأمان.',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: isDark
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            height: 160.h,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0, 0),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),

              child: Image.asset(
                ImagesManager.test,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 12.h),

          Text(
            'الأمر لا يتعلق فقط بالماء؛ بل يتعلق بمنحهم الحق في الحياة. كن سبباً في ري عطشهم اليوم.',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 12.sp,
              color: isDark
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
        ],
      ),
    );
  }
}

class _CommentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cardColor = Theme.of(context).brightness == Brightness.dark
        ? ColorsManager.bgGoogle
        : ColorsManager.white;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(32.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: AssetImage(ImagesManager.test),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'user name',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Get.isDarkMode
                        ? ColorsManager.white
                        : ColorsManager.primaryLight,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'location',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Get.isDarkMode
                        ? ColorsManager.secondaryDark
                        : ColorsManager.secondaryLight,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: ColorsManager.primaryCTA,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: [
                Text(
                  'متابعة',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.white,
                  ),
                ),
                SizedBox(width: 4.w),
                SvgPicture.asset(
                  ImagesManager.notificationBing,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DonateButton extends StatelessWidget {
  const _DonateButton();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          backgroundColor: ColorsManager.primaryCTA,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تبرع بالنجوم',
              style: TextStyle(
                color: ColorsManager.white,
                fontWeight: FontWeight.w800,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 10),
            Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                ImagesManager.star,
                color: ColorsManager.primaryCTA,
              ),
            ),
            //  Icon(Icons.stars , size: 24.r, color: ColorsManager.white,)
          ],
        ),
      ),
    );
  }
}
