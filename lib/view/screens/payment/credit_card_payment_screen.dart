import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/model/donation_summary.dart';
import 'package:crowdfunding_platform/view/widgets/custom_app_bar.dart';
import 'package:crowdfunding_platform/view/widgets/donation_summary_card.dart';
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreditCardPaymentScreen extends StatefulWidget {
  const CreditCardPaymentScreen({super.key});

  @override
  State<CreditCardPaymentScreen> createState() =>
      _CreditCardPaymentScreenState();
}

class _CreditCardPaymentScreenState extends State<CreditCardPaymentScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController securityCodeController = TextEditingController();
  final TextEditingController cardholderNameController =
      TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryDateController.dispose();
    securityCodeController.dispose();
    cardholderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sectionTitleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Theme.of(context).colorScheme.primary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CustomAppBar(
                    title: 'Card_payment'.tr,
                    onIconTap: () => Get.back(),
                  ),
                  SizedBox(height: 16.h),
                  Text('Donation_Summary'.tr, style: sectionTitleStyle),
                  SizedBox(height: 8.h),
                  DonationSummaryCard(
                    summary: DonationSummary(
                      numberStars: 50,
                      amount: 500,
                      title: 'Donation_Summary'.tr,
                      campaignImage: ImagesManager.placeHolder,
                      currency: 'Shakel'.tr,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Text('Card_information'.tr, style: sectionTitleStyle),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        ImagesManager.visaCardsIcon,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  TextFieldWidget(
                    controller: cardNumberController,
                    label: 'Card_number'.tr,
                    hintText: '0000 0000 0000 0000',
                    keyboardType: TextInputType.number,
                    inputFormatters: [_CardNumberInputFormatter()],
                    suffixIcon: SizedBox(
                      width: 24.w,
                      height: 24.h,
                      child: Center(
                        child: SvgPicture.asset(
                          ImagesManager.visaCardIcon,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                          controller: expiryDateController,
                          label: 'Expiry_date'.tr,
                          hintText: 'MM/YY',
                          keyboardType: TextInputType.number,

                          inputFormatters: [_ExpiryDateInputFormatter()],
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: TextFieldWidget(
                          controller: securityCodeController,
                          label: 'Security_code'.tr,
                          hintText: '123',
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          suffixIcon: SizedBox(
                            width: 24.w,
                            height: 24.h,
                            child: Center(
                              child: SvgPicture.asset(
                                ImagesManager.lockIcon,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWidget(
                    controller: cardholderNameController,
                    label: 'Cardholder_name'.tr,
                    hintText: 'As_shown_on_the_card'.tr,
                    textInputAction: TextInputAction.done,
                    // ltrTextWhenFilled: true,
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(RoutesManager.confirmPaymentScreen);
                  },
                  child: Text(
                    '${'Confirmation_of_donation_amount'.tr} ',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'All_card_data_is_protected_and_encrypted.'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digitsOnly.length > 16
        ? digitsOnly.substring(0, 16)
        : digitsOnly;
    final buffer = StringBuffer();

    for (int i = 0; i < limited.length; i++) {
      buffer.write(limited[i]);
      if ((i + 1) % 4 == 0 && i + 1 != limited.length) {
        buffer.write(' ');
      }
    }

    final formatted = buffer.toString();
    final selectionEnd = newValue.selection.end;
    int digitsBeforeCursor = 0;

    for (int i = 0; i < selectionEnd && i < newValue.text.length; i++) {
      if (RegExp(r'\d').hasMatch(newValue.text[i])) {
        digitsBeforeCursor++;
      }
    }

    if (digitsBeforeCursor > limited.length) {
      digitsBeforeCursor = limited.length;
    }

    final int newSelectionIndex = digitsBeforeCursor == 0
        ? 0
        : digitsBeforeCursor + ((digitsBeforeCursor - 1) ~/ 4);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: newSelectionIndex.clamp(0, formatted.length),
      ),
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    final limited = digitsOnly.length > 4
        ? digitsOnly.substring(0, 4)
        : digitsOnly;

    final formatted = limited.length <= 2
        ? limited
        : '${limited.substring(0, 2)}/${limited.substring(2)}';

    final selectionEnd = newValue.selection.end;
    int digitsBeforeCursor = 0;

    for (int i = 0; i < selectionEnd && i < newValue.text.length; i++) {
      if (RegExp(r'\d').hasMatch(newValue.text[i])) {
        digitsBeforeCursor++;
      }
    }

    if (digitsBeforeCursor > limited.length) {
      digitsBeforeCursor = limited.length;
    }

    final int newSelectionIndex = digitsBeforeCursor <= 2
        ? digitsBeforeCursor
        : digitsBeforeCursor + 1;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: newSelectionIndex.clamp(0, formatted.length),
      ),
    );
  }
}
