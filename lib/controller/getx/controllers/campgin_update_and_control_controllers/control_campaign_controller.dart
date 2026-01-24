import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/controller/core/routes/routes_manager.dart';
import 'package:crowdfunding_platform/controller/core/utils/show_snackbar.dart';
import 'package:crowdfunding_platform/model/control_campaign.dart';
import 'package:get/get.dart';

class ControlCampaignController extends GetxController {
  late final ControlCampaignData campaign;

  final RxList<CampaignUpdate> updates = <CampaignUpdate>[].obs;
  final RxInt selectedNavIndex = 2.obs;

  List<CampaignAction> get actions => campaign.actions;

  @override
  void onInit() {
    super.onInit();
    campaign = const ControlCampaignData(
      summary: CampaignSummary(
        titleKey: 'Campaign_title_sample',
        statusLabelKey: 'Active',
        categoryLabelKey: 'water',
        imagePath: ImagesManager.test,
        starsCollected: 2500,
        starsTarget: 5000,
        daysRemaining: 20,
      ),
      performance: PerformanceOverview(
        totalStars: 2500,
        supporters: 12,
        daysRemaining: 20,
      ),
      actions: [
        CampaignAction(type: ControlActionType.edit, labelKey: 'Edit'),
        CampaignAction(type: ControlActionType.share, labelKey: 'Share'),
        CampaignAction(
          type: ControlActionType.addUpdate,
          labelKey: 'Add_Update',
        ),
      ],
      updates: [
        CampaignUpdate(
          title: 'بدأنا الخطوة الأولى بفضل دعمكم',
          description:
              'شاهد المرحلة الاولى من توزيع المياه النظيفة الصحية على مخيمات النزوح في مدينة غزة',
          timeLabel: 'منذ ساعة',
          isLiked: true,
        ),
        CampaignUpdate(
          title: 'شكرًا لأول 100 داعمك 💙',
          description:
              'لقد وصلنا الى اول محطة هامة في رحلتنا . دعمكم يعني العالم بالنسبة لنا وسنبدأ العمل على...',
          timeLabel: 'منذ يومين',
        ),
      ],
    );
    updates.assignAll(campaign.updates);
  }

  double get progress {
    if (campaign.summary.starsTarget == 0) {
      return 0;
    }
    return campaign.summary.starsCollected / campaign.summary.starsTarget;
  }

  int get progressPercent {
    final percent = (progress * 100).round();
    if (percent < 0) {
      return 0;
    }
    if (percent > 100) {
      return 100;
    }
    return percent;
  }

  void toggleLike(int index) {
    final current = updates[index];
    updates[index] = current.copyWith(isLiked: !current.isLiked);
  }

  void onBack() {
    Get.back();
  }

  void onActionTap(ControlActionType type) {
    switch (type) {
      case ControlActionType.edit:
        Get.toNamed(
          RoutesManager.editCampaignDetailsScreen,
          arguments: campaign.summary,
        );
        break;
      case ControlActionType.share:
        showSnackbar(message: 'Share campaign');
        break;
      case ControlActionType.addUpdate:
        Get.toNamed(
          RoutesManager.addUpdateToCampaignScreen,
          arguments: campaign.summary,
        );
        break;
    }
  }

  void onPauseCampaign() {
    showSnackbar(message: 'Campaign paused');
  }

  void onDeleteCampaign() {
    showSnackbar(message: 'Campaign deleted', success: false);
  }

  void onViewAll() {
    showSnackbar(message: 'View all updates');
  }

  void onNavTap(int index) {
    selectedNavIndex.value = index;
  }
}
