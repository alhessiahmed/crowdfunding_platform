import 'package:crowdfunding_platform/view/widgets/login_activity_screen_widgets.dart/connected_device_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConnectedDeviceSection extends StatelessWidget {
  const ConnectedDeviceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current_session'.tr,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        const ConnectedDeviceCard(
          deviceName: 'Samsung S24 Ultra',
          osName: 'Android',
          location: 'خانيونس - فلسطين',
          loginTime: 'منذ دقيقة واحدة',
          isActive: true,
          isCurrentDevice: true,
        ),
        SizedBox(height: 8.h),
        Text(
          'Other_sessions'.tr,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.h),
        const ConnectedDeviceCard(
          deviceName: 'Samsung A56',
          osName: 'Android',
          location: 'خانيونس - فلسطين',
          loginTime: 'منذ دقيقة واحدة',
        ),
        const ConnectedDeviceCard(
          deviceName: 'Samsung A56',
          osName: 'Android',
          location: 'خانيونس - فلسطين',
          loginTime: 'منذ دقيقة واحدة',
        ),
      ],
    );
  }
}
