import 'package:get/get.dart';

class NotificationSettingsController extends GetxController {
  // إشعارات الأثر
  var isImpactUpdatesEnabled = true.obs;
  var isCampaignProgressEnabled = true.obs;

  // إشعارات الحملات
  var isNewCampaignsEnabled = false.obs;
  var isClosingCampaignsEnabled = false.obs;

  // إشعارات النظام
  var isSecurityAlertsEnabled = false.obs;
  var isAccountUpdatesEnabled = false.obs;
}
