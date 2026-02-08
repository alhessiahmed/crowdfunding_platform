import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart'
    show ImagesManager;
import 'package:crowdfunding_platform/view/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EnterCardPaymentInfoSection extends StatelessWidget {
  const EnterCardPaymentInfoSection({
    super.key,
    required this.sectionTitleStyle,
    required this.cardNumberController,
    required this.expiryDateController,
    required this.securityCodeController,
    required this.cardholderNameController,
    this.titlePrefix,
    this.titleSuffix,
  });

  final TextStyle? sectionTitleStyle;
  final TextEditingController cardNumberController;
  final TextEditingController expiryDateController;
  final TextEditingController securityCodeController;
  final TextEditingController cardholderNameController;
  final Widget? titlePrefix;
  final Widget? titleSuffix;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            titlePrefix ?? SizedBox(),

            Text('Card_information'.tr, style: sectionTitleStyle),

            SizedBox(width: 8.w),
            titleSuffix ?? SizedBox(),
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

        ////////////////////////////////////////////////
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
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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

        ////////////////////////////////////////////////
        SizedBox(height: 16.h),
        TextFieldWidget(
          controller: cardholderNameController,
          label: 'Cardholder_name'.tr,
          hintText: 'As_shown_on_the_card'.tr,
          textInputAction: TextInputAction.done,
          // ltrTextWhenFilled: true,
        ),
      ],
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
