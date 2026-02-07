
import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/card_states_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class PaymentCardListTile extends StatelessWidget {
  const PaymentCardListTile({
    super.key,
    required this.endDate,
    required this.visaNumber,
    this.isDefault = false,
  });

  final String endDate;
  final String visaNumber;
  final bool isDefault;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: ListTile(
        leading: SvgPicture.asset(
          ImagesManager.visaPaymentIcon,
          width: 33.w,
          height: 26.h,
        ),
        title: Text(
          visaNumber,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'It_ends_in'.trParams({'date': endDate}),
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: ColorsManager.secondaryLight),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isDefault == true
                ? CardStatesBadge(
                    statusText: 'hypothetical'.tr,

                    icon: SizedBox(),
                    radius: 16.r,
                  )
                : SizedBox(),
            SizedBox(width: 16.w),
            SvgPicture.asset(ImagesManager.threeDotesSettingsIcon),
          ],
        ),
      ),
    );
  }
}
