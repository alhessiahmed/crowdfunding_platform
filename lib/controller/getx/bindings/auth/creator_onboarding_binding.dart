import 'package:get/get.dart';
import '../../controllers/auth/creator_onboarding_controller.dart';

class CreatorOnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatorOnboardingController());
    Get.put(CreatorOnboardingController());
  }
}
