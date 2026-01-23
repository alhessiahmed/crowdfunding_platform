import 'package:crowdfunding_platform/controller/core/constants/colors_manager.dart';
import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/my_campagins_model.dart';
import 'package:crowdfunding_platform/view/widgets/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class MyCampaginsCard extends StatelessWidget {
  const MyCampaginsCard({super.key, required this.myCampaign});
  final MyCampaignsModel myCampaign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  16.w , vertical: 10.h),
      child: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow( 
            color: Colors.black26 , 
            blurRadius: 2, 
            offset: Offset(0, 0)
          )],
          color: Get.isDarkMode
              ? ColorsManager.bgSectionDark
              : ColorsManager.bgSectionLight,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                  //  myCampaign.image.isNotEmpty
                       // ? myCampaign.image
                         ImagesManager.test,
                    height: 96.h,
                    width: 91.w,
                    fit: BoxFit.cover,
                  ),
                ),
                                 SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align( 
                        alignment: Alignment.topLeft,
                        child: _StatusPill(status: myCampaign.status)),
                      SizedBox(height: 8.h),
                      Text(
                        myCampaign.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 13.sp),
                      ),
                       SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'progress_achieved'.tr,
                  style: TextStyle(fontSize: 12.sp),
                ),
                Text(
                  '${myCampaign.progress}%',
                  style: TextStyle(
                    color: ColorsManager.primaryCTA,
                    fontWeight: FontWeight.w800,
                    fontSize: 12.sp
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              child: StepIndicator(progress: myCampaign.progress),
            ),
                    ],
                  ),
                ),
               
              ],
            ),
           
            SizedBox(height: 12.h),
            Container(color: ColorsManager.grey.withOpacity(.5) ,height: 2.h,),
            //Divider(),
            SizedBox(height: 8.h),
            ButtonsRow(status: myCampaign.status),
          ],
        ),
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

  final CampaignStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? ColorsManager.dividerColorDark
            : ColorsManager.dividerColorLight,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow:[ BoxShadow( 
          color: Colors.black26 , 
          blurRadius: 1, 
          offset: Offset(0, 0)
        )]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _statusIcon(status),
            size: 16.sp,
            color: _statusColor(status),
          ),
          SizedBox(width: 4.w),
          Text(
            _statusText(status),
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorsManager.iconDefaultLight),
          ),
        ],
      ),
    );
  }
}

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({super.key, required this.status});
  final CampaignStatus status;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 3.w,
      runSpacing: 8.h,
      children: _buildButtons(status),
    );
  }

  List<Widget> _buildButtons(CampaignStatus status) {
    switch (status) {
      case CampaignStatus.completed:
        return [
          _btn(ColorsManager.blueButton, 'campaign_management'.tr, Icons.settings),
          _btn(ColorsManager.primaryCTA, 'add_update'.tr, Icons.update),
        ];

      case CampaignStatus.active:
        return [
          _btn(ColorsManager.secondaryThanksColor, 'edit_campaign'.tr, Icons.edit),
          _btn(ColorsManager.blueButton, 'campaign_management'.tr, Icons.settings),
          _btn(ColorsManager.danger2, 'stop_compagin'.tr, Icons.stop_circle),
        ];

      case CampaignStatus.paused:
        return [
          _btn(ColorsManager.danger2
          , 'return_compagin'.tr, Icons.play_arrow),
        ];

      case CampaignStatus.draft:
        return [
          _btn(ColorsManager.secondaryThanksColor, 'edit_campaign'.tr, Icons.edit),
          _btn(ColorsManager.danger2, 'delete_campagin'.tr, Icons.delete),
        ];

      case CampaignStatus.deleted:
        return [
          _btn(ColorsManager.primaryCTA, 'repost_the_campaign'.tr, Icons.restart_alt),
        ];

      case CampaignStatus.stopped:
        return [
          _btn(ColorsManager.success, 'return_compagin'.tr, Icons.restart_alt),
        ];
    }
  }

  Widget _btn(Color color, String text, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16.sp),
      label: Text(
        text,
        style: TextStyle(fontSize: 12.sp, color: ColorsManager.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        minimumSize: Size(0, 32.h),
      ),
    );
  }
}

String _statusText(CampaignStatus status) {
  switch (status) {
    case CampaignStatus.completed:
      return 'completed'.tr;
    case CampaignStatus.active:
      return 'active'.tr;
    case CampaignStatus.paused:
      return 'paused'.tr;
    case CampaignStatus.stopped:
      return 'stopped'.tr;
    case CampaignStatus.draft:
      return 'draft'.tr;
    case CampaignStatus.deleted:
      return 'deleted'.tr;
  }
}

IconData _statusIcon(CampaignStatus status) {
  switch (status) {
    case CampaignStatus.completed:
      return Icons.check_circle;
    case CampaignStatus.active:
      return Icons.circle;
    case CampaignStatus.paused:
      return Icons.pause_circle;
    case CampaignStatus.stopped:
      return Icons.stop_circle;
    case CampaignStatus.draft:
      return Icons.drafts_rounded;
    case CampaignStatus.deleted:
      return Icons.delete;
  }
}

Color _statusColor(CampaignStatus status) {
  switch (status) {
    case CampaignStatus.completed:
      return ColorsManager.success;
    case CampaignStatus.active:
      return ColorsManager.success;
    case CampaignStatus.paused:
      return ColorsManager.secondaryThanksColor;
    case CampaignStatus.stopped:
      return ColorsManager.danger;
    case CampaignStatus.draft:
      return ColorsManager.blueButton;
    case CampaignStatus.deleted:
      return ColorsManager.danger;
  }
}


