import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/screens/discover_screen.dart';
import 'package:crowdfunding_platform/view/screens/home_screen.dart';
import 'package:crowdfunding_platform/view/screens/my_campaigns.dart';
import 'package:crowdfunding_platform/view/screens/profile_screen.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      bottom: false,
      minimum: const EdgeInsets.only(bottom: 18, right: 18, left: 18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
            borderRadius: BorderRadius.circular(40.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 12,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: SizedBox(
              height: 72,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                //   _TabItem(
                //     activeIcon: ImagesManager.activeHome,
                //     unActiveIcon: ImagesManager.home,
                //     index: 3,
                //   ),
                //   _TabItem(
                //     activeIcon: ImagesManager.clipboard,
                //     unActiveIcon: ImagesManager.unActiveClipboard,
                //     index: 2,
                //   ),
                //  _CenterActionButton(isDark: isDark),
                  _TabItem(
                    activeIcon: ImagesManager.discover,
                    unActiveIcon: ImagesManager.discover,
                    index: 1,
                  ),

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
        height: 42.h,
        width: 42.w,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Center(
          child: SizedBox( width: 24,
              height: 24,
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

  Widget _CenterActionButton({required bool isDark}) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 54.h,
        width: 54.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? ColorsManager.bgGoogle : ColorsManager.white,
          border: Border.all(color: ColorsManager.secondaryLight, width: 1.5),
        ),
        child: Center(
          child: SvgPicture.asset(
            ImagesManager.addSquare,
            width: 24,
            height: 24,
            color: isDark
                ? ColorsManager.secondaryDark
                : ColorsManager.secondaryLight,
          ),
        ),
      ),
    );
  }
}
