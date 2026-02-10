import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/core/constants/colors_manager.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isPhone = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.onChange,
    this.onEditingComplete,
    this.onSubmitted,
    required this.label,
    this.inputFormatters,
    this.maxLength,
    this.labelImgPath,
    this.readOnly = false,
    this.onTap,
    this.labelWidget,
    this.validator,
  });
  final String label;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isPhone;
  final bool obscureText;
  final int maxLines;
  final int minLines;
  final Function(String)? onChange;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? labelImgPath;
  final bool readOnly;
  final void Function()? onTap;
  final Widget? labelWidget;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelImgPath != null
            ? Row(
                children: [
                  Text(
                    label,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
                  ),
                  SvgPicture.asset(
                    labelImgPath!,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      Get.isDarkMode
                          ? ColorsManager.iconDefaultDark
                          : ColorsManager.iconDefaultLight,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              )
            : Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
              ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 56.h,
          child: TextFormField(
            controller: controller,
            textAlignVertical: TextAlignVertical.center,
            // textAlign: TextAlign.center,
            autovalidateMode: AutovalidateMode.onUnfocus,
            readOnly: readOnly,
            onTap: onTap,
            validator: validator,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 12.sp,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textInputAction: textInputAction,
            keyboardType: isPhone ? TextInputType.phone : keyboardType,
            obscureText: obscureText,
            onChanged: onChange,
            onFieldSubmitted: onSubmitted,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            // minLines: null,
            // maxLines: null,
            // expands: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 22.h,
                horizontal: 16.w,
              ),

              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),

              suffixIcon: suffixIcon == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Center(child: suffixIcon),
                      ),
                    ),
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              prefixIcon: prefixIcon == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: Center(child: prefixIcon),
                      ),
                    ),
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              errorStyle: const TextStyle(height: 0),
              helperStyle: const TextStyle(height: 0),
              filled: true,
              fillColor: Get.isDarkMode
                  ? ColorsManager.bgSectionDark
                  : ColorsManager.bgSectionLight,
              // isDense: true,
              border: textFieldBorder(),
              focusedBorder: textFieldBorder(),
              focusedErrorBorder: textFieldBorder(),
              enabledBorder: textFieldBorder(),
              errorBorder: textFieldBorder(),
              counterText: '',
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder textFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.r),
      borderSide: BorderSide(
        color: Get.isDarkMode
            ? ColorsManager.bgSectionDark
            : ColorsManager.bgSectionLight,
      ),
    );
  }
}
