import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/card_states_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/utils.dart';

class BankAccountCard extends StatelessWidget {
  const BankAccountCard({super.key, required this.title, required this.subtitle, required this.statusText, required this.statusIcon});
  final String title;
  final String subtitle;
  final String statusText;
  final Widget statusIcon;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListTile(
        leading: SvgPicture.asset(
          ImagesManager.bankIcon,
          width: 40.w,
          height: 40.h,
        ),
        title: Text(
          title
          ,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ColorsManager.secondaryLight),
        ),
        trailing: CardStatesBadge(
          statusText: statusText,
          icon: statusIcon,
        ),
      ),
    );
  }
}
