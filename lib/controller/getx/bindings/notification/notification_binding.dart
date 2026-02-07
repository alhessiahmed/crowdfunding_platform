import 'package:crowdfunding_platform/controller/getx/controllers/notifications/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationsController());
  }
}
