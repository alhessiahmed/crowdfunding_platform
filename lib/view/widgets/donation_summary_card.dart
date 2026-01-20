import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DonationSummaryCard extends StatelessWidget {
  const DonationSummaryCard({super.key, required this.summary});
  final DonationSummary summary;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.r),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(summary.campaignImage, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    summary.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Text(
                        summary.numberStars.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorsManager.primaryCTA,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      SvgPicture.asset(
                        ImagesManager.starIcon,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        '${summary.amount} ${summary.currency}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
