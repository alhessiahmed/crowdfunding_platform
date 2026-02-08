import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          SvgPicture.asset(
            ImagesManager.shieldIcon,
            width: 40.w,
            height: 40.h,
            fit: BoxFit.fill,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              'We_monitor_your_account_activity_to_ensure_your_security._You_can_review_your_connected_devices_below.'
                  .tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.secondaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
