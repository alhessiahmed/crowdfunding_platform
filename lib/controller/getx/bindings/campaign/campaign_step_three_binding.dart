import 'package:crowdfunding_platform/controller/getx/controllers/auth/creator_onboarding_controller.dart';
import 'package:crowdfunding_platform/controller/getx/controllers/campaign_create/campaign_step_three_controlller.dart';

import 'package:get/get.dart';

class CampaignStepThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CampaignStepThreeController());
    Get.put(CreatorOnboardingController());
  }
}
