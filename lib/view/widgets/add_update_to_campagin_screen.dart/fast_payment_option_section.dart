import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/add_update_to_campagin_screen.dart/fast_payment_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class FastPaymentOptionSection extends StatelessWidget {
  const FastPaymentOptionSection({
    super.key,
    this.onTapApplePay,
    this.onTapPayPal,
  });
  final void Function()? onTapApplePay;
  final void Function()? onTapPayPal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTapApplePay,
            child: FastPaymentOption(
              title: 'Apple_pay'.tr,
              icon: ImagesManager.applePayIcon,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: GestureDetector(
            onTap: onTapApplePay,
            child: FastPaymentOption(
              title: 'paypal'.tr,
              icon: ImagesManager.paypalPaymentIcon,
            ),
          ),
        ),
      ],
    );
  }
}
