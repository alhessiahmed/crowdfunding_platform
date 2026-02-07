import 'package:crowdfunding_platform/controller/getx/controllers/secuirty_privacy_controller.dart';
import 'package:get/get.dart';

class SecurityPrivactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecuirtyPrivacyController>(
        () => SecuirtyPrivacyController());
  }
}