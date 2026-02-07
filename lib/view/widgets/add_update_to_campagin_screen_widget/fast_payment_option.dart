import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FastPaymentOption extends StatelessWidget {
  const FastPaymentOption({super.key, required this.title, required this.icon});
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      shadow: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, height: 40, width: 40),
          SizedBox(height: 4.h),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: ColorsManager.primaryLight,
            ),
          ),
        ],
      ),
    );
  }
}
