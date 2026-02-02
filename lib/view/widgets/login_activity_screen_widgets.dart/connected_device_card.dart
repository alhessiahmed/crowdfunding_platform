import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/view/widgets/card_divider.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/app_card.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/card_states_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';

class ConnectedDeviceCard extends StatelessWidget {
  const ConnectedDeviceCard({
    super.key,
    required this.deviceName,
    required this.osName,
    required this.location,
    required this.loginTime,
    this.isActive = false,
    this.isCurrentDevice = false,
  });
  final String deviceName;
  final String osName;
  final String location;
  final String loginTime;
  final bool isActive;
  final bool isCurrentDevice;
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.primary,
    );

    final subTitleStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
      color: Theme.of(context).colorScheme.primary,
    );

    final infoTextStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 10.sp,
      color: ColorsManager.secondaryLight,
    );

    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 18.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                ImagesManager.phoneIcon,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(deviceName, style: titleStyle),
                    SizedBox(height: 4.h),
                    Text(
                      'Starry_app_for'.trParams({'OSName': osName}),
                      style: subTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              CardStatesBadge(
                statusText: isActive ? 'Active_now'.tr : 'Offline'.tr,
                statusColor: isActive
                    ? ColorsManager.success
                    : ColorsManager.danger,
                radius: 100.r,
              ),
            ],
          ),

          SizedBox(height: 10.h),

          IntrinsicWidth(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InfoRow(
                  icon: ImagesManager.location,
                  text: location,
                  textStyle: infoTextStyle,
                ),
                SizedBox(height: 11.h),
                _InfoRow(
                  icon: ImagesManager.clockIcon,
                  text: loginTime,
                  textStyle: infoTextStyle,
                ),
              ],
            ),
          ),
          isCurrentDevice ? SizedBox.shrink() : LogoutSection(),
        ],
      ),
    );
  }
}

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final buttonTextStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      color: ColorsManager.white,
      fontWeight: FontWeight.w600,
    );

    return Column(
      children: [
        SizedBox(height: 10.h),
        CardDivider(),
        SizedBox(height: 10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 90.w),
          child: SizedBox(
            height: 32.h,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: ColorsManager.danger,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    ImagesManager.logoutIcon,
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: 10.w),

                  Text('End_session'.tr, style: buttonTextStyle),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
    required this.textStyle,
  });

  final String icon;
  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,

      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        SvgPicture.asset(icon, width: 16.w, height: 16.h),
        SizedBox(width: 4.w),
        Text(
          text,
          style: textStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
