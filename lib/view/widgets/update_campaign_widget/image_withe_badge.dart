import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/card_states_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWitheBadge extends StatelessWidget {
  const ImageWitheBadge({super.key, required this.imagePath, required this.statusBadgeText, required this.statusBadgeColor});
  final String imagePath;
  final String statusBadgeText;
    final Color statusBadgeColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),

          child: Image.asset(
           imagePath ,
            fit: BoxFit.contain,
            height: 200.h,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 12.h,
          right: 12.w,
          child: CardStatesBadge(
            statusColor:statusBadgeColor,
            statusText:statusBadgeText ,
          ),
        ),
      ],
    );
  }
}
