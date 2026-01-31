import 'package:crowdfunding_platform/controller/getx/controllers/notifications/notification_setting_controller.dart';
import 'package:get/get.dart';

class NotificationSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationSettingsController());
  }
}
