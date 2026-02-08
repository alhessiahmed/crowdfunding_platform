import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BankListTileWidget extends StatelessWidget {
  const BankListTileWidget({
    super.key,
    required this.bankName,
    this.isSelected = false,
  });
  final String bankName;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AppCard(
      shadow: true,
      padding: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        title: Text(
          bankName,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),

        leading: SvgPicture.asset(
          ImagesManager.bankIcon,
          width: 24.w,
          height: 24.h,
        ),
        trailing: isSelected
            ? SizedBox(
                width: 28.w,
                height: 28.w,
                child: ClipOval(
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: SvgPicture.asset(
                      ImagesManager.checkLightCircleIcon,
                      width: 24.w,
                      height: 24.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
