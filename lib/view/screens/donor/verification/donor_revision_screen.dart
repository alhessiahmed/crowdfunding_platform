import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/core/constants/images_manager.dart';
import '../../../widgets/information_widget.dart';

class DonorRevisionScreen extends StatelessWidget {
  const DonorRevisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          'send_to_revision'.tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 16.h),
        Text(
          'id_info_extra'.tr,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 16.h),
        Text(
          'clear_summary'.tr,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 12.h),
        InformationWIdget(
          text: 'mail'.tr,
          height: 56.h,
          width: 279.w,
          imgPath: ImagesManager.doneIcon,
          padding: 8,
        ),
        SizedBox(height: 16.h),
        InformationWIdget(
          text: 'mobile'.tr,
          height: 56.h,
          width: 279.w,
          imgPath: ImagesManager.doneIcon,
          padding: 8,
        ),
        SizedBox(height: 16.h),
        InformationWIdget(
          text: 'identity'.tr,
          height: 56.h,
          width: 279.w,
          imgPath: ImagesManager.doneIcon,
          padding: 8,
        ),
      ],
    );
  }
}
