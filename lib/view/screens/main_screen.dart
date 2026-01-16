import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 1;

  final screens = [
    const Scaffold(body: Center(child: Text("profile"))),
    const HomeScreen(),
    const Scaffold(body: Center(child: Text("home"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
      children: [
       
        screens[currentIndex],

       
        Positioned(
          left: 0,
          right: 0,
          bottom: 12, 
          child: _BottomBar(),
        ),
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
      minimum: const EdgeInsets.only(bottom: 18 , right: 18 , left: 18 ,),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16 ,),
        child: Container(
          decoration: BoxDecoration(
            color:isDark ?  ColorsManager.bgGoogle
                : ColorsManager.white,
            borderRadius: BorderRadius.circular(74.r),
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
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _TabItem(icon: ImagesManager.home, index: 2),

                  _TabItem(icon: ImagesManager.explore, index: 1),
                  _TabItem(icon: ImagesManager.profile, index: 0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _TabItem({required String icon, required int index}) {
    final isSelected = currentIndex == index;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        setState(() => currentIndex = index);
      },
      child: SvgPicture.asset(
        icon,
        width: isSelected ? 54 : 24,
        height: isSelected ? 54 : 24,
        color: 
        isSelected
            ? ColorsManager.primaryCTA
            : isDark ? ColorsManager.secondaryDark: ColorsManager.secondaryLight,
      ),
    );
  }

 
}
