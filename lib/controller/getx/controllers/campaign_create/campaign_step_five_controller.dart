import 'package:get/get.dart';

import '../../../core/constants/images_manager.dart';

class CampaignStepFiveController extends GetxController {
  /// وقت المراجعة المتوقع
  final Duration reviewDuration = const Duration(hours: 48);

  /// صورة الساعة (لايت / دارك)
  String get reviewImage =>
      Get.isDarkMode ? ImagesManager.clockDark : ImagesManager.clockLight;

  /// عنوان الصفحة
  String get title => 'campaign_under_review_title'.tr;

  /// الوصف الرئيسي
  String get description => 'campaign_under_review_desc'.tr;

  /// ملاحظة المراجعة الأولى
  String get noteReviewContent => 'campaign_review_note_1'.tr;

  /// ملاحظة وقت المراجعة
  String get noteReviewTime => 'campaign_review_note_2'.trParams({
    'hours': reviewDuration.inHours.toString(),
  });

  /// زر الانتقال للوحة التحكم
  void onGoToDashboard() {
    // Get.offAllNamed(AppRoutes.dashboard);
  }

  /// زر عرض تفاصيل الحملة
  void onViewCampaignDetails() {
    // Get.toNamed(AppRoutes.campaignDetails);
  }
}
