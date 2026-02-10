import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/index.dart';
import 'package:crowdfunding_platform/controller/shared_pref/shared_pref_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;

  final screens = [
    const ProfileScreen(),
    const DiscoverScreen(),
    const MyCampaignsScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          screens[currentIndex],

          Positioned(left: 0, right: 0, bottom: 12, child: _BottomBar()),
        ],
      ),

      // screens[currentIndex],
      // bottomNavigationBar: _BottomBar(),
    );
  }

  Widget _BottomBar() {
    final String? userType = SharedPrefController().userType;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(bottom: 18.h, right: 18.w, left: 18.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 12.r,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: BottomAppBar(
            height: 74.h,
            color: Colors.transparent,
            elevation: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (userType != UserRole.GUEST.name) ...{
                  _TabItem(
                    activeIcon: ImagesManager.activeHome,
                    unActiveIcon: ImagesManager.home,
                    index: 3,
                  ),
                  if (userType == UserRole.CAMPAIGN_CREATOR.name)
                    _TabItem(
                      activeIcon: ImagesManager.clipboard,
                      unActiveIcon: ImagesManager.unActiveClipboard,
                      index: 2,
                    ),

                  _CenterActionButton(
                    index: userType == UserRole.CAMPAIGN_CREATOR.name ? -1 :1,
                    isDark: isDark,
                    icon: userType == UserRole.CAMPAIGN_CREATOR.name
                        ? ImagesManager.addSquare
                        : ImagesManager.discover,
                    // onTap: () {
                    //   userType == UserRole.CAMPAIGN_CREATOR.name
                    //       ? Get.toNamed(RoutesManager.CampaignStepOneScreen)
                    //       : Get.to(Ro);
                    // },
                  ),
                },
                  if (userType != UserRole.DONOR.name)
                     _TabItem(
                        activeIcon: ImagesManager.discover,
                        unActiveIcon: ImagesManager.discover,
                        index: 1,
                      )
                    ,

                _TabItem(
                  activeIcon: ImagesManager.activeProfile,
                  unActiveIcon: ImagesManager.profile,
                  index: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _TabItem({
    required String activeIcon,
    required String unActiveIcon,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        setState(() => currentIndex = index);
      },
      child: Container(
        height: 54.h,
        width: 54.w,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Center(
          child: SizedBox(
            width: 24.w,
            height: 24.h,
            child: SvgPicture.asset(
              unActiveIcon,
              // isSelected ? activeIcon : unActiveIcon,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? ColorsManager.primaryCTA
                    : isDark
                    ? ColorsManager.secondaryDark
                    : ColorsManager.secondaryLight,
                BlendMode.srcIn,
              ),
              color: isSelected
                  ? ColorsManager.primaryCTA
                  : isDark
                  ? ColorsManager.secondaryDark
                  : ColorsManager.secondaryLight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _CenterActionButton({
    required int index,

    required bool isDark,
    required String icon,
   // required void Function()? onTap,
  }) {
    final bool isSelected = index == currentIndex ;
    return InkWell(
  onTap: () {
       index != -1
       ? setState(() => currentIndex = index) 
       :Get.toNamed(RoutesManager.CampaignStepOneScreen)
       ;
      },
      child: Container(
        height: 54.h,
        width: 54.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
          border: Border.all(color:isSelected ? ColorsManager.primaryCTA: ColorsManager.secondaryLight, width: 1.5),
        ),
        child: Center(
          child: SvgPicture.asset(
            icon,
            // ImagesManager.addSquare,
            width: 24.w,
            height: 24.h,
           color:isSelected ? ColorsManager.primaryCTA: ColorsManager.secondaryLight
          ),
        ),
      ),
    );
  }
}
