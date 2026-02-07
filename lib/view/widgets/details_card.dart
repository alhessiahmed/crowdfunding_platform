import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/card_divider.dart';
import 'package:crowdfunding_platform/view/widgets/detail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.labelStyle,
    required this.valueStyle,
    required this.totalStyle,
    required this.numberStars,
    required this.maskedCardNumber,
    required this.donationAmount,
    required this.serviceFees,
    required this.totalAmount,
  });

  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final TextStyle? totalStyle;
  final int numberStars;
  final String maskedCardNumber;
  final num donationAmount;
  final num serviceFees;
  final num totalAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.shadow,
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Column(
          children: [
            DetailRow(
              label: 'Number_of stars'.tr,
              labelStyle: labelStyle,
              value: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.ltr,
                children: [
                  SvgPicture.asset(
                    ImagesManager.backIcon,
                    fit: BoxFit.contain,
                    height: 16.h,
                    width: 16.w,
                  ),
                  SizedBox(width: 4.w),
                  Text('$numberStars', style: valueStyle),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            DetailRow(
              label: 'payment_method'.tr,
              labelStyle: labelStyle,
              value: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.ltr,
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: Center(
                      child: SvgPicture.asset(
                        ImagesManager.visaCardIcon,
                        height: 18.h,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    maskedCardNumber,
                    style: valueStyle,
                    textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
            CardDivider(),
            DetailRow(
              label: 'Donation_value'.tr,
              labelStyle: labelStyle,
              value: Text('$donationAmount ${'Shakel'.tr}', style: valueStyle),
            ),
            SizedBox(height: 16.h),

            DetailRow(
              label: 'Service_fees'.tr,
              labelStyle: labelStyle,
              value: Text('$serviceFees ${'Shakel'.tr}', style: valueStyle),
            ),
            CardDivider(),
            DetailRow(
              label: 'Total_donation_amount'.tr,
              labelStyle: labelStyle,
              value: Text('$totalAmount ${'Shakel'.tr}', style: totalStyle),
            ),
          ],
        ),
      ),
    );
  }
}
