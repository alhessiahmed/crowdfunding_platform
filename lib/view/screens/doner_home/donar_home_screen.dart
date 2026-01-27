import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/donar_home/donar_home_controller.dart';
import 'package:crowdfunding_platform/view/widgets/donar_home_screen_widget/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DonarHomeScreen extends GetView<DonarHomeController> {
  const DonarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Header(
                      title: 'مرحباً فوزي 👋',
                      subTitle:
                          'Here_you_can_track_your_impact_and_support_new_campaigns_with_stars'
                              .tr,
                      profileUrl: ImagesManager.profileHolder,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
